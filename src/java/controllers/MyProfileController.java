/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("USER") != null) {
            request.getRequestDispatcher("views/myprofile.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
            //request.getRequestDispatcher().forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isCompleteProfile = true;
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String telephone = request.getParameter("telephone");
        String cnp = request.getParameter("cnp");
        String university = request.getParameter("university");
        String yearOfStudy = request.getParameter("yearOfStudy");
        String studentid = request.getParameter("studentid");
        String birthdate = request.getParameter("birthdate");
        System.out.println("BBBBBBBBBBBBBBBBBBBBBb");
        System.out.println("AAAA" + birthdate);

        User u = (User) request.getSession().getAttribute("USER");
        
        
        if (fullname != null && !fullname.isEmpty()) {
            u.setFullName(fullname);
        } else {
            isCompleteProfile = false;
            System.out.println("1");
        }
        if (email != null && !email.isEmpty()) {
            u.setEmail(email);
        } else {
            isCompleteProfile = false;
            System.out.println("2");
        }
        if (gender != null && !gender.isEmpty()) {
            u.setGender(gender);
        } else {
            isCompleteProfile = false;
            System.out.println("3");
        }
        if (telephone != null && !telephone.isEmpty()) {
            u.setTelephone(telephone);
        } else {
            isCompleteProfile = false;
            System.out.println("4");
        }
        if (cnp != null && !cnp.isEmpty()) {
            System.out.println(cnp);
            u.setCnp(cnp);
        } else {
            isCompleteProfile = false;
            System.out.println("5");
        }
        if (university != null && !university.isEmpty()) {
            u.setUniversity(university);
        } else {
            isCompleteProfile = false;
            System.out.println("6");
        }

        if (studentid != null && !studentid.isEmpty()) {
            u.setStudentId(studentid);
        } else {
            isCompleteProfile = false;
            System.out.println("7");
        }

        if (yearOfStudy != null && !yearOfStudy.isEmpty()) {
            u.setYearOfStudy(Short.parseShort(yearOfStudy));
        } else {
            isCompleteProfile = false;
            System.out.println("8");
        }
        
        if (birthdate != null && !birthdate.isEmpty()) {
            System.out.println("BBBBBBBBBBBBBBBBBBBBBb");
            System.out.println(birthdate);
            try {
                u.setDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse(birthdate));
            } catch (ParseException ex) {
                System.out.println("EXCEPTION");
                Logger.getLogger(MyProfileController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            isCompleteProfile = false;
            System.out.println("9");
        }
        System.out.println(isCompleteProfile);
        u.setCompleteProfile(isCompleteProfile);
        if (UserDAO.updateUser(u)) {
            request.getSession().setAttribute("USER", u);
            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("views/myprofile.jsp").forward(request, response);
        }
        
    }

}
