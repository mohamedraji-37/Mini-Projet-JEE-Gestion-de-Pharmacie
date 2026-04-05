package dao;
import java.sql.*;
import model.LigneCommande;
import util.DBConnection;

public class LigneCommandeDAO {
    public void save(LigneCommande ligne) {
        String sql = "INSERT INTO ligne_commande (id_commande, id_medicament, quantite, prix_unitaire) VALUES (?, ?, ?, ?)";
        String updateStock = "UPDATE medicament SET quantite = quantite - ? WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection()) {

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ligne.getIdCommande());
            ps.setInt(2, ligne.getIdMedicament());
            ps.setInt(3, ligne.getQuantite());
            ps.setDouble(4, ligne.getPrixUnitaire());
            ps.executeUpdate();

            PreparedStatement psStock = conn.prepareStatement(updateStock);
            psStock.setInt(1, ligne.getQuantite());
            psStock.setInt(2, ligne.getIdMedicament());
            psStock.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
}