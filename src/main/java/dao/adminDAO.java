package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

public class adminDAO {

    public boolean checkLog(String user, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();
        
           
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.trim());
            ps.setString(2, password);

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
