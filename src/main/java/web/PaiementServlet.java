package web;

import dao.*;

import model.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/paiement")
public class PaiementServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String total = request.getParameter("total");
        request.setAttribute("totalFinal", total);
        request.getRequestDispatcher("paiement.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String nom = request.getParameter("nomCarte");
        
       
        String totalStr = request.getParameter("totalFinal"); 
        
        ArrayList<HashMap<String, String>> panier = (ArrayList<HashMap<String, String>>) session.getAttribute("panier");

        if (nom != null && !nom.isEmpty() && panier != null && !panier.isEmpty() && totalStr != null) {
            try {
               
                String codeSuivi = "PHAR-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
                
     
                Commande cmd = new Commande();
                cmd.setIdClient(8);
                cmd.setTotal(Double.parseDouble(totalStr));
                cmd.setCodeSuivi(codeSuivi);
                cmd.setEtat("En attente");

               
                CommandeDAO cDao = new CommandeDAO();
                int idCmd = cDao.create(cmd);

                if (idCmd != -1) {
                    LigneCommandeDAO lDao = new LigneCommandeDAO();
                    for (HashMap<String, String> item : panier) {
                        LigneCommande lc = new LigneCommande();
                        lc.setIdCommande(idCmd);
                        lc.setIdMedicament(Integer.parseInt(item.get("id")));
                        lc.setQuantite(Integer.parseInt(item.get("quantite")));
                        lc.setPrixUnitaire(Double.parseDouble(item.get("prix")));
                        lDao.save(lc); 
                    }
                }

                
                session.removeAttribute("panier");
                response.sendRedirect("succes.jsp?code=" + codeSuivi); 
                
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("commande");
            }
        } else {
            request.setAttribute("erreur", "Données de paiement invalides.");
            doGet(request, response);
        }
    }
}