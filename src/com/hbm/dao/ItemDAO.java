package com.hbm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

public class ItemDAO extends DAO{
	public Item getItem(String itemId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "FROM Item I WHERE I.id=:itemId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("itemId",itemId);
		
		@SuppressWarnings("unchecked")
		List<Item> results = query.list();
		
		Item item = null;
		if(results.size()>0)
			item = results.get(0);
		
		transaction.commit();
		hibernateSession.close();
		return item;
	}
	public int deleteItem(String itemId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "DELETE FROM Item I WHERE I.Id = :itemId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("itemId", itemId);
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		
		transaction.commit();
		hibernateSession.close();
		return result;
	}
}
