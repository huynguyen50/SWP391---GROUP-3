package com.hrm.dao;

import com.hrm.model.entity.Employee;
import com.hrm.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public List<Employee> getAll() {
        List<Employee> list = new ArrayList<>();
        String sql = """
            SELECT e.*, d.DeptName 
            FROM Employee e 
            LEFT JOIN Department d ON e.DepartmentID = d.DepartmentID
        """;

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Employee e = new Employee();
                e.setEmployeeId(rs.getInt("EmployeeID"));
                e.setFullName(rs.getString("FullName"));
                e.setGender(rs.getString("Gender"));
                e.setDob(rs.getDate("DOB") != null ? rs.getDate("DOB").toLocalDate() : null);
                e.setAddress(rs.getString("Address"));
                e.setPhone(rs.getString("Phone"));
                e.setEmail(rs.getString("Email"));
                e.setDepartmentId(rs.getInt("DepartmentID"));
                e.setDepartmentName(rs.getString("DeptName"));
                e.setPosition(rs.getString("Position"));
                e.setEmploymentPeriod(rs.getString("EmploymentPeriod"));
                e.setStatus(rs.getString("Status"));
                list.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Employee getById(int id) {
        String sql = "SELECT * FROM Employee WHERE EmployeeID=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Employee e = new Employee();
                e.setEmployeeId(rs.getInt("EmployeeID"));
                e.setFullName(rs.getString("FullName"));
                e.setGender(rs.getString("Gender"));
                e.setDob(rs.getDate("DOB") != null ? rs.getDate("DOB").toLocalDate() : null);
                e.setAddress(rs.getString("Address"));
                e.setPhone(rs.getString("Phone"));
                e.setEmail(rs.getString("Email"));
                e.setDepartmentId(rs.getInt("DepartmentID"));
                e.setPosition(rs.getString("Position"));
                e.setEmploymentPeriod(rs.getString("EmploymentPeriod"));
                e.setStatus(rs.getString("Status"));
                return e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insert(Employee e) {
        String sql = """
            INSERT INTO Employee (FullName, Gender, DOB, Address, Phone, Email, 
                                  DepartmentID, Position, EmploymentPeriod, Status)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """;
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, e.getFullName());
            ps.setString(2, e.getGender());
            ps.setDate(3, e.getDob() != null ? Date.valueOf(e.getDob()) : null);
            ps.setString(4, e.getAddress());
            ps.setString(5, e.getPhone());
            ps.setString(6, e.getEmail());
            ps.setObject(7, e.getDepartmentId(), Types.INTEGER);
            ps.setString(8, e.getPosition());
            ps.setString(9, e.getEmploymentPeriod());
            ps.setString(10, e.getStatus());

            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean update(Employee e) {
        String sql = """
            UPDATE Employee SET FullName=?, Gender=?, DOB=?, Address=?, Phone=?, Email=?, 
                                DepartmentID=?, Position=?, EmploymentPeriod=?, Status=? 
            WHERE EmployeeID=?
        """;
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, e.getFullName());
            ps.setString(2, e.getGender());
            ps.setDate(3, e.getDob() != null ? Date.valueOf(e.getDob()) : null);
            ps.setString(4, e.getAddress());
            ps.setString(5, e.getPhone());
            ps.setString(6, e.getEmail());
            ps.setObject(7, e.getDepartmentId(), Types.INTEGER);
            ps.setString(8, e.getPosition());
            ps.setString(9, e.getEmploymentPeriod());
            ps.setString(10, e.getStatus());
            ps.setInt(11, e.getEmployeeId());

            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM Employee WHERE EmployeeID=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
