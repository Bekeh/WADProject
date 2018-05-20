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

/**
 *
 * @author Alex Admin
 */
@WebServlet(name = "MyProfileController", urlPatterns = {"/myProfile"})
public class MyProfileController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.getRequestDispatcher("views/myprofile.jsp").forward(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/myprofile.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String telephone = request.getParameter("telphone");
            String cnp = request.getParameter("cnp");
            String university = request.getParameter("university");
            String yearOfStudy = request.getParameter("yearOfStudy");
            String joinDate = request.getParameter("joinDate");
 
        User u = (User) request.getSession().getAttribute("USER");
            
        if(username != null){
            u.setUsername(username);
        }
        if(fullname != null){
            u.setUsername(fullname);
          
        }
        if(email != null){
            u.setEmail(email);
        }
        if(gender != null){
            u.setGender(gender);
        }
        if(telephone != null){
            u.setTelephone(telephone);
        }
        if(cnp != null){
            u.setCnp(cnp);
        }
        if(university != null){
            u.setUniversity(university);
        }     
        
        if(joinDate != null){
            u.setUniversity(university);
        }
        
        if(yearOfStudy != null){
            u.setUniversity(university);
        } 
                
        request.getRequestDispatcher("views/myprofile.jsp").forward(request, response);
   
    }

}
