package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.Client;
import util.DBConnection;

public class ClientDAO {

    public Client validate(String email, String password) {
        Client client = null;
        String sql = "SELECT * FROM client WHERE email = ? AND password = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                client = new Client();
                client.setId(rs.getInt("id"));
                client.setNom(rs.getString("nom"));
                client.setEmail(rs.getString("email"));
                client.setTelephone(rs.getString("telephone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return client;
    }

    public boolean emailExiste(String email) throws Exception {
        String sql = "SELECT id FROM client WHERE email = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public int ajouterClient(Client client) throws Exception {
        String sql = "INSERT INTO client (nom, telephone, email, password) VALUES (?, ?, ?, ?)";
        int generatedId = -1;
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, client.getNom());
            ps.setString(2, client.getTelephone());
            ps.setString(3, client.getEmail());
            ps.setString(4, client.getPassword());
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }
        }
        return generatedId;
    }
}