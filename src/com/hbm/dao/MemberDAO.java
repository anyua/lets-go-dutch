package com.hbm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
//import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//import org.hibernate.cfg.Configuration;

import com.hbm.model.*;

public class MemberDAO extends DAO {
	//private static final Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
	//private static final StandardServiceRegistryBuilder srb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	//private static final SessionFactory factory = cfg.buildSessionFactory(srb.build());
	
	public String addMember(String userId,String activityId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		UserDAO userDao = new UserDAO();
		User user = userDao.getUser(userId);
		ActivityDAO actDao = new ActivityDAO();
		Activity act = actDao.getActivity(activityId);
		
		Member member = new Member();
		member.setActivity(act);
		member.setUser(user);
		member.getJoinItems().addAll(act.getItems());
		
		hibernateSession.save(member);
		String hql = "SELECT M.id FROM Member M JOIN M.User U WHERE U.id = :userid";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("username",userId);
		List results = query.list();
		
		String resultString = null;
		if (results.size() == 1)
			resultString = results.get(0).toString();
		transaction.commit();
		hibernateSession.close();
		return resultString;
	}
	public Member getMember(String memberId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "FROM Member M WHERE M.id=:memberId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("memberId",memberId);
		
		@SuppressWarnings("unchecked")
		List<Member> results = query.list();
		
		Member mem = null;
		if (results.size()>0)
			mem = results.get(0);
		transaction.commit();
		hibernateSession.close();
		return mem;
	}
}
