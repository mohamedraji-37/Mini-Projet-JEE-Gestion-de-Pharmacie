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

  

}
