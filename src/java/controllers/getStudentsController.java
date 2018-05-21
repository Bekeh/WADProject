/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "getStudentsController", urlPatterns = {"/getstudents"})
public class getStudentsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getParameter("edit") != null){
            
            Map <String, Object> map = new HashMap<>();
            boolean isValid= false;
            String username = request.getParameter("username");
            if (username != null && username.trim().length() != 0) {
                isValid = true;
                User u = null;
                u = UserDAO.checkUser(username);
                if(u != null) {
                    map.put("fullname", u.getFullName());
                    map.put("email", u.getEmail());
                    map.put("role", u.getRole());
                    map.put("gender", u.getGender());
                    map.put("phone", u.getTelephone());
                    map.put("cnp", u.getCnp());
                    map.put("university", u.getUniversity());
                    map.put("studentid", u.getStudentId());
                    map.put("yearofstudy", u.getYearOfStudy());
                    if (u.getDateOfBirth() != null) {
                        map.put("birthdate", new SimpleDateFormat("yyyyy-MM-dd").format(u.getDateOfBirth()));
                    }
                    
                    map.put("completeprofile", u.isCompleteProfile());
                    
                }
                
                request.getSession().setAttribute("EDITUSERNAME", username);
            }
            map.put("isValid", isValid);
            write(response, request, map);
            
            
        } else
        if(request.getParameter("name") != null) {
            List<User> users = UserDAO.searchUsers(request.getParameter("name"));
            request.getSession().setAttribute("USERS", users);
            request.getRequestDispatcher("views/getStudents.jsp").forward(request, response);
        } else {
            List<User> users = UserDAO.getAllUsers();
            request.getSession().setAttribute("USERS", users);
            request.getRequestDispatcher("views/getStudents.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Map <String, Object> map = new HashMap<>();
            boolean isValid= false;
            String username = (String)request.getSession().getAttribute("EDITUSERNAME");
            if (username != null && username.trim().length() != 0) {
                //
                User u = new User();
                u.setCnp(request.getParameter("cnp"));
                System.out.println(request.getParameter("completeprofile"));
                u.setCompleteProfile(Boolean.valueOf(request.getParameter("completeprofile")));
                //u.setDateOfBirth(new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("birthdate")));
                System.out.println(request.getParameter("birthdate"));
                 u.setUsername(username);
                u.setEmail(request.getParameter("email"));
                u.setFullName(request.getParameter("fullname"));
                u.setGender(request.getParameter("gender"));
                u.setRole(request.getParameter("role"));
                u.setStudentId(request.getParameter("studentid"));
                u.setTelephone(request.getParameter("phone"));
                u.setUniversity(request.getParameter("university"));
                u.setYearOfStudy(Short.parseShort(request.getParameter("yearofstudy")));
                
                
                
                System.out.println(UserDAO.updateUser(u));
                isValid = true;
                request.getSession().setAttribute("EDITUSERNAME", null);
                request.getRequestDispatcher("views/getStudents.jsp").forward(request, response);
            }
            map.put("isValid", isValid);
            write(response, request, map);
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void write(HttpServletResponse response,HttpServletRequest request, Map<String, Object> map) throws IOException{
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(map));
    }
    
    

}
