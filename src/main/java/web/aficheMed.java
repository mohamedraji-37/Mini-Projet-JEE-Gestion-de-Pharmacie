package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Medicament;

import java.io.IOException;

import dao.MedicamentDAO;

@WebServlet("/aficheMed")
public class aficheMed extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Medicament m = MedicamentDAO.getMedicamentById(id);
		req.setAttribute("med", m);
		req.getRequestDispatcher("Medicament.jsp").forward(req, res);
	}

	

}
