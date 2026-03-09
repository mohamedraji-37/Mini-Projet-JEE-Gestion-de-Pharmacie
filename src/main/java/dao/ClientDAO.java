package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Client;

import util.DBConnection;

public class ClientDAO {

    public boolean checkLogin(String email, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();
        
           
            String sql = "SELECT * FROM client WHERE email = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    

     
        public boolean emailExiste(String email) throws Exception {
            String sql = "SELECT * FROM client WHERE email = ?";
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, email);
                try (ResultSet rs = ps.executeQuery()) {
                    return rs.next();
                }
            }
        }

      
        public void ajouterClient(Client client) throws Exception {
            String sql = "INSERT INTO client (nom, telephone, email, password) VALUES (?, ?, ?, ?)";
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, client.getNom());
                ps.setString(2, client.getTelephone());
                ps.setString(3, client.getEmail());
                ps.setString(4, client.getPassword());
                ps.executeUpdate();
            }
        }
   
}
