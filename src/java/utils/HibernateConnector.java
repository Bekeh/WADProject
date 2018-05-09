/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author Alex Admin
 */
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateConnector {

	private static HibernateConnector me;
	private static Configuration cfg;
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;

	private HibernateConnector() throws HibernateException {
		createSessionFactory();
	}

	public static SessionFactory createSessionFactory() {
		cfg = new Configuration().configure();
		serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		sessionFactory = cfg.buildSessionFactory(serviceRegistry);
		return sessionFactory;
	}

	public static synchronized HibernateConnector getInstance() throws HibernateException {
            if (me == null) {
                me = new HibernateConnector();
            }
            return me;
	}

	public Session getSession() throws HibernateException {
		Session session = sessionFactory.openSession();
		if (!session.isConnected()) {
			this.reconnect();
		}
		return session;
	}

	private void reconnect() throws HibernateException {
		HibernateConnector.sessionFactory = createSessionFactory();
	}
}
