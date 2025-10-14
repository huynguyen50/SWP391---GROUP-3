package com.hrm.dao;

import com.hrm.model.entity.SystemUser;
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
        String sql = "SELECT * FROM SystemUser WHERE username = ?";
        SystemUser sys = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sys = new SystemUser(rs.getInt("userId"), rs.getString("username"), rs.getString("password"), rs.getInt("roleId"),
                        rs.getObject("lastLogin", java.time.LocalDateTime.class), rs.getBoolean("isActive"),
                        rs.getObject("createdDate", java.time.LocalDateTime.class), rs.getInt("employeeId")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error getting systemUser by username: " + e.getMessage());
        }
        return sys;
    }
    
    public int changePassword(String username, String newPass){
        String sql = "UPDATE SystemUser SET password=? Where username=?";
        int result=0;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, username);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error getting systemUser by username: " + e.getMessage());
        }
        return result;
    }
    
    public boolean checkEmailExist(String email) {
    String sql = "SELECT COUNT(*) FROM Employee WHERE email = ?";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0; // Nếu có ít nhất 1 dòng, email đã tồn tại
        }
    } catch (SQLException e) {
        System.err.println("Error checking email existence: " + e.getMessage());
    }
    return false;
}

}
