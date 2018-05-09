/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
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
        
        User u = new User("Nae Alexandru","naealexg@gmail.com", "parola", "naealexg@gmail.com");
        System.out.println(UserDAO.registerUser(u));
        //System.out.println(HibernateConnector.getInstance().getSession());
    }
    
}
