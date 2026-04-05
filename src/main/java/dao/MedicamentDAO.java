package dao;

import model.Medicament;

import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicamentDAO {

    private Connection conn;

    public MedicamentDAO() {
        this.conn = DBConnection.getConnection();
    }

    public void ajouter(Medicament m) throws SQLException {

        String sql = "INSERT INTO medicament (nom, description, prix, quantite, date_expiration, image) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, m.getNom());
        ps.setString(2, m.getDescription());
        ps.setDouble(3, m.getPrix());
        ps.setInt(4, m.getQuantite());

        if (m.getDateExpiration() != null) {
            ps.setDate(5, Date.valueOf(m.getDateExpiration()));
        } else {
            ps.setDate(5, null);
        }

        ps.setString(6, m.getImage());

        ps.executeUpdate();
        ps.close();
    }
    public static boolean supprimerMedicament(int id) {
        boolean rowDeleted = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM medicament WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rowDeleted = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
    public static Medicament getMedicamentById(int id) {

        Medicament m = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM medicament WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                m = new Medicament();

                m.setId(rs.getInt("id"));
                m.setNom(rs.getString("nom"));
                m.setDescription(rs.getString("description"));
                m.setPrix(rs.getDouble("prix"));
                m.setQuantite(rs.getInt("quantite"));
                m.setImage(rs.getString("image"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return m;
    }
    
    public List<Medicament> getAllMedicaments() {

        List<Medicament> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM medicament";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Medicament m = new Medicament();

                m.setId(rs.getInt("id"));
                m.setNom(rs.getString("nom"));
                m.setDescription(rs.getString("description"));
                m.setPrix(rs.getDouble("prix"));
                m.setQuantite(rs.getInt("quantite"));

                Date date = rs.getDate("date_expiration");
                if(date != null){
                    m.setDateExpiration(date.toLocalDate());
                }

                m.setImage(rs.getString("image"));

                list.add(m);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean modifier(Medicament m) throws SQLException {
        String sql = "UPDATE medicament SET nom=?, description=?, prix=?, quantite=?, date_expiration=?, image=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, m.getNom());
        ps.setString(2, m.getDescription());
        ps.setDouble(3, m.getPrix());
        ps.setInt(4, m.getQuantite());
        
        if (m.getDateExpiration() != null) {
            ps.setDate(5, Date.valueOf(m.getDateExpiration()));
        } else {
            ps.setDate(5, null);
        }
        
        ps.setString(6, m.getImage());
        ps.setInt(7, m.getId());

        boolean rowUpdated = ps.executeUpdate() > 0;
        ps.close();
        return rowUpdated;
    }
}

  


