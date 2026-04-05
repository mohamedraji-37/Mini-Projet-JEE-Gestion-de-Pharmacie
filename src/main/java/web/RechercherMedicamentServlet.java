package web;

import dao.MedicamentDAO;
import model.Medicament;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/rechercherMedicament")
public class RechercherMedicamentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("idMedicament");
        
        try {
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);
                Medicament m = MedicamentDAO.getMedicamentById(id);

                if (m == null) {
                    
                    request.setAttribute("erreur", "Aucun médicament trouvé pour l'ID : " + id);
                } else {
            
                    request.setAttribute("medTrouve", m);
                }
            } else {
                request.setAttribute("erreur", "Veuillez entrer un ID.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("erreur", "L'ID doit être un nombre.");
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}