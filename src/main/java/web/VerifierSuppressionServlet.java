package web;

import dao.MedicamentDAO;
import model.Medicament;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/verifierSuppression")
public class VerifierSuppressionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Medicament m = MedicamentDAO.getMedicamentById(id);
        if(m == null){
            request.setAttribute("message", "Médicament introuvable");
            RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
            rd.forward(request,response);
        }

        request.setAttribute("medicament", m);
        RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
        rd.forward(request, response);
    }
}
