/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
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
          System.out.println(e.getMessage());
         if (tx!=null) tx.rollback();
      }catch (Exception e) {
            System.out.println(e.getMessage());
      }
      return userID;
    }
    
    public static List<User> getAllUsers() {
        Session session = null;
        List<User> users = new ArrayList<>();
        try {
            
            session = HibernateConnector.getInstance().getSession();
            Query query = session.createQuery("from User u where u.role = :role");
            query.setParameter("role", "STUDENT");
            users = query.list();
            if (users != null && !users.isEmpty() && users.size() > 0) {
                return users;
            }
        } catch(HibernateException hb) {
            return users;
        }
        return users;
    }
    
    public static List<User> searchUsers(String queryString) {
        Session session = null;
        List<User> users = new ArrayList<>();
        try {
            
            session = HibernateConnector.getInstance().getSession();
            Query query = session.createQuery("from User u where u.fullName like '%':role'%' and u.role ='STUDENT'");
            query.setParameter("role", queryString);
            users = query.list();
            if (users != null && !users.isEmpty() && users.size() > 0) {
                return users;
            }
        } catch(HibernateException hb) {
            return users;
        }
        return users;
    }
    
    public static User checkUser(String username) {
        Session session = null;
        User u = null;
        try {
            
            session = HibernateConnector.getInstance().getSession();
            Query query = session.createQuery("from User u where u.username = :username");
            query.setParameter("username", username);
            List<User> queryList = query.list();
            if (queryList != null && !queryList.isEmpty()) {
                u = (User)queryList.get(0);
                session.close();
                return u;
                
            }
        } catch(HibernateException hb) {
            session.close();
            return u;
        }
        session.close();
        return u;
    }
    
    public static boolean updateUser(User user) {
        Session session = null;
        Transaction tx = null;
        try {
            
            session = HibernateConnector.getInstance().getSession();
            /*
            Query query = session.createQuery("from User u where u.username = :username");
            query.setParameter("username", user.getUsername());
            List<User> users = query.list();
            
            if (users != null && !users.isEmpty() && users.size() > 0) {
                user.setId(users.get(0).getId());
            } */
            
                System.out.println(user.getUsername());
            User u = checkUser(user.getUsername());
            System.out.println(u);
            System.out.println("AAAAAAAAAAAAAAAa" + user.getDateOfBirth());
                u.setCnp(user.getCnp());
                u.setCompleteProfile(user.isCompleteProfile());
                u.setDateOfBirth(user.getDateOfBirth());
                u.setEmail(user.getEmail());
                u.setFullName(user.getFullName());
                u.setGender(user.getGender());
                u.setRole(user.getRole());
                u.setStudentId(user.getStudentId());
                u.setTelephone(user.getTelephone());
                u.setUniversity(user.getUniversity());
                u.setYearOfStudy(user.getYearOfStudy());
            
            
                    
            tx = session.beginTransaction();
            session.update(u);
            tx.commit();
        } catch(HibernateException hb) {
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
            System.out.println(hb.getMessage());
            System.out.println(hb.getStackTrace());
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        }
        return true;
    }
    
    public static User login(User user) {
        Session session = null;
        User u = null;
        try {
            
            session = HibernateConnector.getInstance().getSession();
            Query query = session.createQuery("from User u where u.username = :username and u.password = :password");
            query.setParameter("username", user.getUsername());
            query.setParameter("password", user.getPassword());
            
            List<User> queryList = query.list();
            
            if (queryList != null && !queryList.isEmpty()) {
                u = (User)queryList.get(0);
                /*
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String strDate = sdf.format(u.getDateOfBirth());
                try {
                    Date c = sdf.parse(strDate);
                    System.out.println(c);
                } catch (ParseException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                */
                return u;
            }
        } catch(HibernateException hb) {
            return u;
        }
        return u;
    }
    
}
