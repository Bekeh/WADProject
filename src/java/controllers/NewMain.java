/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.RoomDAO;
import dao.UserDAO;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojos.Room;
import pojos.User;
import utils.HibernateConnector;

/**
 *
 * @author Alex Admin
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
       
       RoomDAO.addStudent();

        
       
        
            
    }
    
}
