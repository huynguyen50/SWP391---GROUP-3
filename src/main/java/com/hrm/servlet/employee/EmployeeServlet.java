package com.hrm.servlet.employee;

import com.hrm.model.entity.Employee;
import com.hrm.service.EmployeeService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/admin/employees")
public class EmployeeServlet extends HttpServlet {
    private final EmployeeService service = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("employee", service.getById(id));
                req.getRequestDispatcher("/Views/EmployeeForm.jsp").forward(req, resp);
                break;
            case "new":
                req.getRequestDispatcher("/Views/EmployeeForm.jsp").forward(req, resp);
                break;
            case "delete":
                service.delete(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect(req.getContextPath() + "/admin/employees");
                break;
            default:
                req.setAttribute("employees", service.getAll());
                req.getRequestDispatcher("/Views/EmployeeList.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Employee e = new Employee();
        String id = req.getParameter("id");
        if (id != null && !id.isEmpty()) e.setEmployeeId(Integer.parseInt(id));

        e.setFullName(req.getParameter("fullName"));
        e.setGender(req.getParameter("gender"));
        e.setDob(LocalDate.parse(req.getParameter("dob")));
        e.setAddress(req.getParameter("address"));
        e.setPhone(req.getParameter("phone"));
        e.setEmail(req.getParameter("email"));
        e.setDepartmentId(Integer.parseInt(req.getParameter("departmentId")));
        e.setPosition(req.getParameter("position"));
        e.setEmploymentPeriod(req.getParameter("employmentPeriod"));
        e.setStatus(req.getParameter("status"));

        service.save(e);
        resp.sendRedirect(req.getContextPath() + "/admin/employees");
    }
}
