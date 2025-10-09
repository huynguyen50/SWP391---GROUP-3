/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.lang.reflect.Array;
import model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

public class DAO {

    private Connection con;
    Vector<User> users;

    public static DAO Ins = new DAO();

    public DAO() {
        if (Ins == null) {
            Ins = this;
            try {
                con = new DBConnection().getConnection();
            } catch (Exception e) {
                System.err.println("Error at connection " + e.getMessage());
            }
        }
    }

    public SystemUser getAccountByUsername(String username) {
        String sql = "SELECT * FROM Accounts WHERE username = ?";
        SystemUser sys = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sys = new SystemUser(rs.getInt("userId"), rs.getString("username"), rs.getString("password"), rs.getInt("roleId"),
                        rs.getTimestamp("lastLogin"), rs.getBoolean("isActive"), rs.getTimestamp("createdDate"), rs.getInt("employeeId")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error getting systemUser by username: " + e.getMessage());
        }
        return sys;
    }
}
