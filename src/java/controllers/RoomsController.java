/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojos.Room;

/**
 *
 * @author Alex Admin
 */
@WebServlet(name = "RoomsController", urlPatterns = {"/rooms"})
public class RoomsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("STATUS");
        System.out.println(status);
        if (status != null && !status.isEmpty() && status.equalsIgnoreCase("add")) {
            request.setAttribute("ACTION", "ADD");
        } else {
            request.setAttribute("ACTION", "VIEW");
            List<Room> rooms = new ArrayList<>();
            rooms = RoomDAO.getRooms();
            request.getSession().setAttribute("ROOMS", rooms);
        }
        request.getRequestDispatcher("views/addRooms.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int size = Integer.valueOf(request.getParameter("size"));
        int rnumber = Integer.valueOf(request.getParameter("rnumber"));
        
        Room r = new Room(size,rnumber);
        int i = RoomDAO.addRoom(r);
        if(i > 0 ) {
            response.sendRedirect("home");
        }
    }

}
