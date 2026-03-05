package web;

import dao.MedicamentDAO;
import model.Medicament;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/ajouterMedicament")
@MultipartConfig
public class AjouterMedicament extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

           

            String nom = request.getParameter("nom");
            String description = request.getParameter("description");

            double prix = Double.parseDouble(request.getParameter("prix"));
            int quantite = Integer.parseInt(request.getParameter("quantite"));

            // ✅ IMPORTANT : correspond au name="date_expiration" dans ton JSP
            String dateStr = request.getParameter("date_expiration");

            LocalDate dateExpiration = null;
            if (dateStr != null && !dateStr.isEmpty()) {
                dateExpiration = LocalDate.parse(dateStr);
            }

            // ===== Upload Image =====

            Part imagePart = request.getPart("image");
            String image = null;

            if (imagePart != null &&
                imagePart.getSubmittedFileName() != null &&
                !imagePart.getSubmittedFileName().isEmpty()) {

                image = imagePart.getSubmittedFileName();

                // Dossier images dans ton projet
                String uploadPath = getServletContext().getRealPath("") + "Images";

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

              
                imagePart.write(uploadPath + File.separator + image);
            }

            

            Medicament m = new Medicament();
            m.setNom(nom);
            m.setDescription(description);
            m.setPrix(prix);
            m.setQuantite(quantite);
            m.setDateExpiration(dateExpiration);
            m.setImage(image);

      

            MedicamentDAO dao = new MedicamentDAO();
            dao.ajouter(m);

            // Redirection après succès
            response.sendRedirect("succes.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur : " + e.getMessage());}
    }
}