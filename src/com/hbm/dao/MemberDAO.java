package com.hbm.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

/**
 * �������������member����
 * �����ݿ�֮����еĲ�����
 * member����ͨ�����ر��ⲿ����
 * ������activityDAO��userDAO����
 * @author ANYUANZHI
 * @version 1.0
 */
public class MemberDAO extends DAO {
	/**
	 * �˷������������ݿ��м���һ��member��Ŀ
	 * ���Һ���Ӧ�Ļ��Ϣ���û�������һ��
	 * ��ϵ�ǣ����û���Ϊ�˴˻�е�һ����Ա
	 * @param userId �û�id
	 * @param activityId �id
 	 * @return ��ӳɹ�����member��id��ʧ�ܷ���null
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
	 * �˷������ڴ����ݿ���ȡ��һ��
	 * member�����ȫ����Ϣ��
	 * @param memberId Ҫ���ҵ�member��id
	 * @return һ��member����
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
