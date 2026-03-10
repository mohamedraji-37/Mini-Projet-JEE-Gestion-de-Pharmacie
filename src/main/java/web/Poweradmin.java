package web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import dao.adminDAO;
import util.MD5Util;

@WebServlet("/Poweradmin")
public class Poweradmin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String us = request.getParameter("user");
		String pas = request.getParameter("pass");
		String hash = MD5Util.md5(pas.trim());

		adminDAO check = new adminDAO();

		if (check.checkLog(us, hash)) {
			HttpSession session = request.getSession();
			session.setAttribute("nomAdmin", us);
			response.sendRedirect("adminDashboard.jsp");
		} 
		else {
			request.setAttribute("error", "incorrect user or password");
			request.getRequestDispatcher("Powerlogin.jsp").forward(request, response);
		}
	}
}
