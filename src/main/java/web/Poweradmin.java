package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
		
		if (check.checkLog(us, hash))
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", us);
            response.sendRedirect("adminDashboard.jsp");
		}
		else
			request.setAttribute("error", "incorrect user or password");
			request.getRequestDispatcher("Power.jsp").forward(request, response);
	}

}
