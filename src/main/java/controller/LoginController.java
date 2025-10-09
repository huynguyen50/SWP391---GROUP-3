/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SystemUser;

/**
 *
 * @author DELL
 */
@WebServlet(name="LoginController", urlPatterns={"/login"})
public class LoginController extends HttpServlet {
    DAO dao=new DAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                request.setAttribute(cookie.getName(), cookie.getValue());
            }
        }
        request.getRequestDispatcher("/Views/Login.jsp").forward(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String remember = request.getParameter("rememberMe");
        SystemUser sys = dao.Ins.getAccountByUsername(username);
        if(sys!=null && sys.getPassword().equals(password)){
            request.getSession().setAttribute("systemUser", sys);
            Cookie remember_userName = new Cookie("username", username);
            Cookie remember_password = new Cookie("password", password);
            
            if(remember != null){
                remember_userName.setMaxAge(24 * 60 * 60);//1 day
                remember_password.setMaxAge(24 * 60 * 60);
            } else {
                remember_userName.setMaxAge(0);
                remember_password.setMaxAge(0);
            }
            response.addCookie(remember_userName);
            response.addCookie(remember_password);
            response.sendRedirect("/Views/home.jsp");
        }
        else{
            String mess="Wrong username or password!!!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("/Views/Login.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
