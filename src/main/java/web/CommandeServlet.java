package web;

import dao.*;
import model.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/commande")
public class CommandeServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MedicamentDAO medDao = new MedicamentDAO(); 
        request.setAttribute("listeMedicaments", medDao.getAllMedicaments()); 
        request.getRequestDispatcher("Commande.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<HashMap<String, String>> panier = (ArrayList<HashMap<String, String>>) session.getAttribute("panier");
        
        if (panier == null) { 
            panier = new ArrayList<>(); 
            session.setAttribute("panier", panier); 
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            HashMap<String, String> item = new HashMap<>();
            item.put("id", request.getParameter("id"));
            item.put("nom", request.getParameter("nom"));
            item.put("prix", request.getParameter("prix"));
            item.put("quantite", request.getParameter("quantite"));
            item.put("image", request.getParameter("image")); 
            panier.add(item);
            response.sendRedirect(request.getContextPath() + "/commande");

        } else if ("remove".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < panier.size()) {
                panier.remove(index);
            }
            response.sendRedirect(request.getContextPath() + "/commande");

        } else if ("clear".equals(action)) {
            panier.clear();
            response.sendRedirect(request.getContextPath() + "/commande");

        } else if ("valider".equals(action)) {
            String total = request.getParameter("total");
           
            response.sendRedirect("paiement?total=" + total);
        }
    }
}