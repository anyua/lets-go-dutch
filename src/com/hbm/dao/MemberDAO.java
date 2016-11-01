package com.hbm.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

/**
 * 这个类用来进行member对象
 * 与数据库之间进行的操作，
 * member对象通常不必被外部访问
 * 仅用于activityDAO和userDAO类中
 * @author ANYUANZHI
 * @version 1.0
 */
public class MemberDAO extends DAO {
	/**
	 * 此方法用于在数据库中加入一个member条目
	 * 并且和相应的活动信息和用户关联在一起
	 * 关系是，此用户成为了此活动中的一个成员
	 * @param userId 用户id
	 * @param activityId 活动id
 	 * @return 添加成功返回member的id，失败返回null
	 */
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
		Iterator<Item> it = act.getItems().iterator();
		while(it.hasNext())
		{
			Item item =it.next();
			item.setNumOfMembers(item.getNumOfMembers()+1);
			member.getJoinItems().add(item);
		}
		//member.getJoinItems().addAll(act.getItems());
		hibernateSession.update(act);
		hibernateSession.save(member);

		transaction.commit();
		hibernateSession.close();
		
		Session hibernateSession2 = factory.openSession();
		Transaction transaction2 = hibernateSession2.beginTransaction();
		
		String hql = "SELECT M.id FROM Member M WHERE M.id = :userid";
		Query query = hibernateSession2.createQuery(hql);
		query.setParameter("userid",userId);
		List results = query.list();
		
		String resultString = null;
		if (results.size() == 1)
			resultString = results.get(0).toString();
		
		transaction2.commit();
		hibernateSession2.close();
		return resultString;
	}
	/**
	 * 此方法用于从数据库中取得一个
	 * member对象的全部信息，
	 * @param memberId 要查找的member的id
	 * @return 一个member对象
	 */
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
	public int deleteMember(String memberId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "DELETE FROM Member M WHERE M.id = :memberId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("memberId", memberId);
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		
		transaction.commit();
		hibernateSession.close();
		return result;
	}
}
