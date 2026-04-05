package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ClientDAO;
import model.Client;
import util.MD5Util;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null) email = email.trim();
        if (password != null) {
            password = MD5Util.md5(password.trim());
        }

        ClientDAO clientDAO = new ClientDAO();
        Client client = clientDAO.validate(email, password);

        if (client != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", client);
            response.sendRedirect("UserIndex.jsp");
        } else {
            request.setAttribute("error", "Email ou mot de passe incorrect !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}