package web;

import dao.CommandeDAO;
import model.Commande;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/traitementCommande")
public class TraitementCommandeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        
        List<Commande> liste = CommandeDAO.getAllCommandes();
        
     
        request.setAttribute("listeCommandes", liste);
        request.getRequestDispatcher("gestionCommandes.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String idParam = request.getParameter("idCmd");
            String nouvelEtat = request.getParameter("nouvelEtat");

            if (idParam != null && nouvelEtat != null) {
                int idCmd = Integer.parseInt(idParam);
                
               
                boolean ok = CommandeDAO.modifierEtat(idCmd, nouvelEtat);

                if(ok) {
                    request.setAttribute("succes", "La commande #" + idCmd + " est désormais " + nouvelEtat);
                } else {
                    request.setAttribute("erreur", "Impossible de mettre à jour la commande.");
                }
            }
        } catch (Exception e) {
            request.setAttribute("erreur", "Erreur lors du traitement : " + e.getMessage());
        }

        
        doGet(request, response);
    }
}