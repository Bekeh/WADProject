/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import java.io.IOException;
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
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/registeration.jsp").forward(request, response);
    }
    

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    public RegisterController() {
    }
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = UserUtils.encryptPass(request.getParameter("password"));
        String email = request.getParameter("email");
        
        User u = new User(name, username, password, email);
        
        if (UserDAO.checkUser(username) != null) {
            request.getSession().setAttribute("USER", u);
            request.setAttribute("errors", "User exists!");
            request.getRequestDispatcher("/views/registeration.jsp").forward(request, response);
        } else {
            //User user = UserDAO.registerUser(u);
            if (UserDAO.registerUser(u) != 0){
                request.getSession().setAttribute("USER", u);
                response.sendRedirect("home");
            } else {
                request.setAttribute("errors", "There was a problem with registering");
                request.getRequestDispatcher("/views/registeration.jsp").forward(request, response);
            }

        }
    }


}