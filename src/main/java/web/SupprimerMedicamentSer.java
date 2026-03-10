package web;

import dao.MedicamentDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/supprimerMedicament")
public class SupprimerMedicamentSer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        MedicamentDAO.supprimerMedicament(id);

        request.setAttribute("succes", "ok");

        RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
        rd.forward(request, response);
    }

}