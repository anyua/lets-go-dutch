package com.hbm.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.hbm.model.*;

public class UserDAO {
	private User user;
	
	private static final Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
	private static final StandardServiceRegistryBuilder srb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	private static final SessionFactory factory = cfg.buildSessionFactory(srb.build());
	
	public String addUser(String username,String password,boolean sex,String nickname)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		user=new User();
		user.setUserName(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setNickname(nickname);
		
		hibernateSession.save(user);
		
		transaction.commit();
		hibernateSession.close();
		return "lalala";
	}
}
