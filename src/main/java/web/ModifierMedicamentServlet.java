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

@WebServlet("/modifierMedicament")
@MultipartConfig
public class ModifierMedicamentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Medicament m = MedicamentDAO.getMedicamentById(id);

            if (m != null) {
                request.setAttribute("medAModifier", m);
            } else {
                request.setAttribute("erreur", "Médicament introuvable.");
            }
        } catch (Exception e) {
            request.setAttribute("erreur", "ID invalide.");
        }
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            double prix = Double.parseDouble(request.getParameter("prix"));
            int quantite = Integer.parseInt(request.getParameter("quantite"));
            String dateStr = request.getParameter("dateAjout"); 
            String imageExistante = request.getParameter("imageActuelle");

        
            String nomImageFinal;
            Part filePart = request.getPart("imageFichier");

            if (filePart != null && filePart.getSize() > 0) {
                nomImageFinal = filePart.getSubmittedFileName();
                String uploadPath = getServletContext().getRealPath("/Images");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                filePart.write(uploadPath + File.separator + nomImageFinal);
            } else {
                nomImageFinal = imageExistante;
            }

            Medicament m = new Medicament();
            m.setId(id);
            m.setNom(nom);
            m.setPrix(prix);
            m.setQuantite(quantite);
            m.setDescription(description);
            m.setImage(nomImageFinal);
            
            
            if (dateStr != null && !dateStr.isEmpty()) {
                m.setDateExpiration(LocalDate.parse(dateStr)); 
            }

            MedicamentDAO dao = new MedicamentDAO();
            if (dao.modifier(m)) {
                request.setAttribute("succes", "Médicament #" + id + " mis à jour !");
            } else {
                request.setAttribute("erreur", "Erreur base de données.");
            }

        } catch (Exception e) {
            request.setAttribute("erreur", "Erreur : " + e.getMessage());
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}