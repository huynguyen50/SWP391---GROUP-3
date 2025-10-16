package com.hrm.controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "dashboard";
        }

        switch (action) {
            case "dashboard":
                request.setAttribute("activePage", "dashboard");
                request.getRequestDispatcher("Admin/AdminHome.jsp").forward(request, response);
                break;

            case "employees":
                request.setAttribute("activePage", "employees");
                loadEmployees(request, response);
                break;

            case "departments":
                request.setAttribute("activePage", "departments");
                request.getRequestDispatcher("Admin/Departments.jsp").forward(request, response);
                break;

            case "profile":
                request.setAttribute("activePage", "profile");
                request.getRequestDispatcher("Admin/Profile.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("Admin/Login.jsp");
        }
    }

    private void loadEmployees(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        List<Map<String, Object>> employeeList = new ArrayList<>();

        try {
            // Kết nối DB
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                      "jdbc:mysql://localhost:3306/hrm_db", "root", "123");

            // Truy vấn dữ liệu
            String sql = "SELECT EmployeeID, FullName, Gender, Email, Position, Status FROM Employee";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Map<String, Object> emp = new HashMap<>();
                emp.put("EmployeeID", rs.getInt("EmployeeID"));
                emp.put("FullName", rs.getString("FullName"));
                emp.put("Gender", rs.getString("Gender"));
                emp.put("Email", rs.getString("Email"));
                emp.put("Position", rs.getString("Position"));
                emp.put("Status", rs.getString("Status"));
                employeeList.add(emp);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("Admin/Employees.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles admin home page navigation";
    }
}
