package web;

import dao.MedicamentDAO;
import model.Medicament;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/medicaments")
public class ListMedicamentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MedicamentDAO dao = new MedicamentDAO();

        List<Medicament> medicaments = dao.getAllMedicaments();

        request.setAttribute("medicaments", medicaments);

        RequestDispatcher rd = request.getRequestDispatcher("listeMedicaments.jsp");

        rd.forward(request, response);
    }
}