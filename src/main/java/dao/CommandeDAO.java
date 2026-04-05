package dao;

import java.sql.*;
import model.Commande;
import util.DBConnection;
import java.util.List;
import java.util.ArrayList;

public class CommandeDAO {

	public int create(Commande cmd) {
	    String sql = "INSERT INTO commande (id_client, total, date_commande, code_suivi, etat) VALUES (?, ?, NOW(), ?, ?)";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
	        ps.setInt(1, cmd.getIdClient());
	        ps.setDouble(2, cmd.getTotal());
	        ps.setString(3, cmd.getCodeSuivi());
	        ps.setString(4, cmd.getEtat());
	        ps.executeUpdate();
	        
	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) return rs.getInt(1); 
	    } catch (SQLException e) { e.printStackTrace(); }
	    return -1;
	}

    public Commande findByCode(String code) {
        String sql = "SELECT * FROM commande WHERE code_suivi = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Commande cmd = new Commande();
                cmd.setIdCommande(rs.getInt("id_commande"));
                cmd.setIdClient(rs.getInt("id_client"));
                cmd.setTotal(rs.getDouble("total"));
                cmd.setDateCommande(rs.getDate("date_commande").toLocalDate());
                cmd.setCodeSuivi(rs.getString("code_suivi"));
                cmd.setEtat(rs.getString("etat"));
                return cmd;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
   
    public static List<Commande> getAllCommandes() {
        List<Commande> liste = new ArrayList<>();
        String sql = "SELECT * FROM commande ORDER BY date_commande DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Commande c = new Commande();
                c.setIdCommande(rs.getInt("id_commande"));
                c.setIdClient(rs.getInt("id_client"));
                c.setTotal(rs.getDouble("total"));
                c.setCodeSuivi(rs.getString("code_suivi"));
                c.setEtat(rs.getString("etat"));

                Date sqlDate = rs.getDate("date_commande");
                if (sqlDate != null) {
                    c.setDateCommande(sqlDate.toLocalDate());
                }

                liste.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return liste;
    }

    public static boolean modifierEtat(int idCmd, String nouvelEtat) {
        String sql = "UPDATE commande SET etat = ? WHERE id_commande = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, nouvelEtat);
            ps.setInt(2, idCmd);
            
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}