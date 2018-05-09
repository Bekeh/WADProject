/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojos.User;
import utils.HibernateConnector;

/**
 *
 * @author Alex Admin
 */
public class UserDAO {
    
    public static int registerUser(User user) {
        Session session = null;
        Transaction tx = null;
        Integer userID = 0;
        try{
            session = HibernateConnector.getInstance().getSession();
            tx = session.beginTransaction();
            userID = (Integer) session.save(user);
            tx.commit();
      }catch (HibernateException e) {
         if (tx!=null) tx.rollback();
      }
      return userID;
    }
    
}
