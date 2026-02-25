package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ClientDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ S'assurer que l'encodage est correct
        request.setCharacterEncoding("UTF-8");

        // 2️⃣ Récupérer les paramètres et supprimer les espaces en trop
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null) email = email.trim();
        if (password != null) password = password.trim();
        System.out.println("EMAIL = [" + email + "]");
        System.out.println("PASSWORD = [" + password + "]");

        

        // 4️⃣ Vérifier les infos en base
        ClientDAO clientDAO = new ClientDAO();
        boolean isValid = clientDAO.checkLogin(email, password);

        if (isValid) {
            // ✅ Connexion réussie : créer la session
            HttpSession session = request.getSession();
            session.setAttribute("user", email);

            response.sendRedirect("dashboard.jsp");
        } else {
            // ❌ Connexion échouée : afficher message d'erreur
            request.setAttribute("error", "Email ou mot de passe incorrect !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}