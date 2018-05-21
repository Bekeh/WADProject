/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojos.User;
import utils.UserUtils;

/**
 *
 * @author Alex Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(UserUtils.encryptPass(request.getParameter("password")));
        
        user = UserDAO.login(user);
        if (user != null) {
            request.getSession().setAttribute("USER", user);
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            request.getRequestDispatcher("/home").forward(request, response);
        }
        
    }

    

}
