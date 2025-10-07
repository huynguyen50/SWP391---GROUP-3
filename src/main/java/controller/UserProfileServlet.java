package controller;

import dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("user");

        if (sessionUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(sessionUser.getEmail());
        request.setAttribute("user", user);
        request.getRequestDispatcher("user-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("user");

        if (sessionUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String department = request.getParameter("department");

        User updatedUser = new User(
                sessionUser.getUserID(),
                fullName,
                sessionUser.getEmail(),
                phone,
                address,
                department
        );

        UserDAO dao = new UserDAO();
        boolean success = dao.updateUserProfile(updatedUser);

        if (success) {
            session.setAttribute("user", updatedUser); // Cập nhật lại session
            request.setAttribute("success", "Profile updated successfully!");
        } else {
            request.setAttribute("error", "Update failed! Please try again.");
        }

        request.setAttribute("user", updatedUser);
        request.getRequestDispatcher("user-profile.jsp").forward(request, response);
    }
}
