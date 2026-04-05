package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ClientDAO;
import model.Client;
import util.MD5Util;

@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

   
        String hash = MD5Util.md5(password.trim());

        Client client = new Client();
        client.setNom(nom);
        client.setTelephone(telephone);
        client.setEmail(email);
        client.setPassword(hash);

        ClientDAO dao = new ClientDAO();

        try {
            if(dao.emailExiste(email)) { 
                request.setAttribute("error", "Cet email est déjà utilisé.");
                request.getRequestDispatcher("inscription.jsp").forward(request, response);
            } else {
                dao.ajouterClient(client); 
                request.setAttribute("success", "Inscription réussie !");
                request.getRequestDispatcher("UserIndex.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de l'inscription.");
            request.getRequestDispatcher("inscription.jsp").forward(request, response);
        }
    }
}