package com.hbm.dao;

import java.util.List;

import org.hibernate.Query;
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
		//添加新的用户，如果添加失败或者用重复的用户名返回null，否则返回id
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		user=new User();
		user.setUserName(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setNickname(nickname);
		
		hibernateSession.save(user);
		String hql = "SELECT U.id FROM User U WHERE U.userName = :username";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("username",username);
		List results = query.list();
		
		String resultString = null;
		if (results.size() == 1)
			resultString = results.get(0).toString();
		transaction.commit();
		hibernateSession.close();
		return resultString;
	}
	public String findUser(String username,String password)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "SELECT U.id FROM User U WHERE U.userName = :username and U.password = :password";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("username",username);
		query.setParameter("password",password);
		List results = query.list();
		
		String resultString = null;
		if (results.size()>0)
			resultString = results.get(0).toString();
		transaction.commit();
		hibernateSession.close();
		return resultString;
	}
	public User getUser(String userId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "FROM User U WHERE U.id=:userId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("userId",userId);
		
		@SuppressWarnings("unchecked")
		List<User> results = query.list();
		
		user = null;
		if (results.size()>0)
			user = results.get(0);
		transaction.commit();
		hibernateSession.close();
		return user;
	}
	public void joinActivity(String userId,String activityId){}
	public void ownActivity(){}
	public void updateUser(){}
	public void deleteUser(){}
}
