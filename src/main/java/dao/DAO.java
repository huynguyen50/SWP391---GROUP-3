package dao;

import model.SystemUser;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAO {

    private static DAO instance;
    private Connection con;

    private DAO() {
        try {
            con = DBConnection.getConnection();
        } catch (SQLException e) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "Lỗi kết nối DB", e);
        }
    }

    public static synchronized DAO getInstance() {
        if (instance == null) {
            instance = new DAO();
        }
        return instance;
    }

    public SystemUser getAccountByUsername(String username) {
        String sql = "SELECT * FROM Accounts WHERE username = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new SystemUser(
                        rs.getInt("userId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getObject("lastLogin", java.time.LocalDateTime.class),
                        rs.getBoolean("isActive"),
                        rs.getObject("createdDate", java.time.LocalDateTime.class),
                        rs.getInt("employeeId")
                );
            }
        } catch (SQLException e) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "Lỗi truy vấn getAccountByUsername", e);
        }
        return null;
    }
}
