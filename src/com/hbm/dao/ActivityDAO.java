package com.hbm.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
//import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//import org.hibernate.cfg.Configuration;

import com.hbm.model.*;

public class ActivityDAO extends DAO
{
	//private static final Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
	//private static final StandardServiceRegistryBuilder srb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	//private static final SessionFactory factory = cfg.buildSessionFactory(srb.build());
	
	public String addActivity(String name,String info,Date createDate,Date endDate,double wholeAmount,int size)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		Activity act = new Activity();
		act.setName(name);
		act.setInfo(info);
		act.setCreateDate(createDate);
		act.setEndDate(endDate);
		act.setSize(size);
		
		hibernateSession.save(act);
		String hql = "SELECT A.id FROM Activity A WHERE A.name = :name";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("name", name);
		List results = query.list();
		
		String resultString = null;
		if (results.size() == 1)
			resultString = results.get(0).toString();
		transaction.commit();
		hibernateSession.close();
		return resultString;
	}
	public Activity getActivity(String activityId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "FROM Activity A WHERE A.id = :actId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("actId",activityId);
		
		@SuppressWarnings("unchecked")
		List<Activity> results = query.list();
		
		Activity act = null;
		if(results.size()>0)
			act = results.get(0);
		
		transaction.commit();
		hibernateSession.close();
		return act;
	}
	public String findActivity(String activityName)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "SELECT A.id FROM Activity A WHERE A.name = :activityName";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("activityName",activityName);
		List results = query.list();
		
		String resultString = null;
		if (results.size()>0)
			resultString = results.get(0).toString();
		transaction.commit();
		hibernateSession.close();
		return resultString;
	}
	public void userJoinin(String activityId, String userId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		UserDAO userDao=new UserDAO();
		Activity act = getActivity(activityId);
		MemberDAO memDao = new MemberDAO();
		String memberId = memDao.addMember(userId, activityId);
		Member member = memDao.getMember(memberId);
		User user = userDao.getUser(userId);
		user.getJoinedActivity().add(act);
		act.getMembers().add(member);
		
		Item tempItem = null;
		Iterator<Item> it = act.getItems().iterator();
		while(it.hasNext())
		{
			tempItem=it.next();
			tempItem.setNumOfMembers(tempItem.getNumOfMembers()+1);
		}
		
		hibernateSession.update(user);
		hibernateSession.update(act);
		
		transaction.commit();
		hibernateSession.close();
	}
	public void addItem(String activityId,String itemDetial,double itemAmount)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		Activity act = getActivity(activityId);
		int numOfMembers = act.getMembers().size();
		
		Item item = new Item();
		item.setActivity(act);
		item.setAmount(itemAmount);
		item.setDetial(itemDetial);
		item.setNumOfMembers(numOfMembers);
		
		act.getItems().add(item);
		
		Iterator<Member> it = act.getMembers().iterator();
		while(it.hasNext())
			it.next().getJoinItems().add(item);
		
		hibernateSession.save(item);
		hibernateSession.update(act);
		
		transaction.commit();
		hibernateSession.close();
	}
}
