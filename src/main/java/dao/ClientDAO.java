package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

public class ClientDAO {

    public boolean checkLogin(String email, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();
         // DEBUG: afficher tous les emails de la table client
            String testSql = "SELECT email, password FROM client";
            PreparedStatement testPs = con.prepareStatement(testSql);
            ResultSet testRs = testPs.executeQuery();

            while (testRs.next()) {
                System.out.println("DB => email=" + testRs.getString("email")
                    + " | password=" + testRs.getString("password"));
            }

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
}
