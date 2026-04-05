package web;

import dao.CommandeDAO;
import model.Commande;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/suivi")
public class SuiviServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code != null && !code.trim().isEmpty()) {
            CommandeDAO dao = new CommandeDAO();
            Commande cmd = dao.findByCode(code.trim());
            if (cmd != null) {
                request.setAttribute("maCommande", cmd);
            } else {
                request.setAttribute("msg", "Désolé, ce code de suivi est introuvable.");
            }
        }
        request.getRequestDispatcher("suiviCommande.jsp").forward(request, response);
    }
}
