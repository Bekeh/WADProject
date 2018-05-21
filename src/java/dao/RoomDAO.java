/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
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
public class RoomDAO {
    
    public static int addRoom(Room room) {
        Session session = null;
        Transaction tx = null;
        Integer roomId = 0;
        try{
            session = HibernateConnector.getInstance().getSession();
            tx = session.beginTransaction();
            roomId = (Integer)session.save(room);
            tx.commit();
      }catch (HibernateException e) {
         if (tx!=null) tx.rollback();
      }
        return roomId;
    }
    
    public static List<Room> getRooms() {
        Session session = null;
        Transaction tx = null;
        List<Room> rooms = new ArrayList<>();
        try{
            
            session = HibernateConnector.getInstance().getSession();
            Query query = session.createQuery("from Room");
            rooms = query.list();
            if (!rooms.isEmpty() && rooms.size() > 0) {
                return rooms;
            }
        } catch(HibernateException hb) {
            return rooms;
        }
        session.close();
        return rooms;
            
    }
    
    public static void addStudent() {
        Session session = null;
        Transaction tx = null;
        try{
            
            User u = UserDAO.checkUser("ionescu");
            
            //Room room = RoomDAO.getRooms().get(0);
            
            List<User> users = new ArrayList<>();
            
            users.add(u);
            //room.setStudents(users);
            session = HibernateConnector.getInstance().getSession();
            tx = session.beginTransaction();
            
            Query query = session.createQuery("from Room");
            List<Room> rooms = query.list();
            Room room = rooms.get(0);
            room.setStudents(users);
            u.setRoom(room);
            session.update(room);
            tx.commit();
            session.close();
      }catch (HibernateException e) {
            System.out.println(e.getMessage());
         if (tx!=null) tx.rollback();
      }
       
    }
    
}
