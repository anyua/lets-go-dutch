package com.hbm.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

/**
 * ���������������User�������ݿ���������Ĺ����ࡣ
 * ��������������ʽֱ�Ӳ������ݿ��е�User����
 * ���Ҳ�����ͬ������Ҫ���ò�ͬ�ķ���
 * @author ANYUANZHI
 * @version 1.0
 */
public class UserDAO extends DAO {
	/**
	 * �˷������������ݿ������һ���µ�user��Ŀ
	 * ��ʼ�����˷����������ṩ�ı�������Ϊ��
	 * @param username ���û�����
	 * @param password ���û�����
	 * @param sex �Ա�
	 * @param nickname �ǳ�
 	 * @return ������ݿ���û���û����ظ�����Ŀ������ӳɹ�����Ψһid�����򷵻�null
	 */
	public String addUser(String username,String password,boolean sex,String nickname)
	{
		Session hibernateSessionBefor = factory.openSession();
		Transaction transactionBefor = hibernateSessionBefor.beginTransaction();
		
		String hql2 = "SELECT U.id FROM User U WHERE U.userName = :username";
		Query query2 = hibernateSessionBefor.createQuery(hql2);
		query2.setParameter("username",username);
		List results2 = query2.list();
		if(results2.size()>0)
			return null;
		
		transactionBefor.commit();
		hibernateSessionBefor.close();
		
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		User user=new User();
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
	/**
	 * �˷������ڸ����û����Ͷ�Ӧ����������ݿ���
	 * ��ȡ��Ӧ�û���Ψһ��ʶID
	 * @param username �û���
	 * @param password ��Ӧ����
	 * @return ���ر�ʶid��û���ҵ�����null
	 */
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
	/**
	 * �˷�������ͨ���û�id�����ݿ��еõ�һ������User
	 * �����ȫ����Ϣ�����������Ļ�ȣ�id����ͨ��find�����õ�
	 * @param userId �û�id
	 * @return һ��user����
	 */
	public User getUser(String userId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "FROM User U WHERE U.id=:userId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("userId",userId);
		
		@SuppressWarnings("unchecked")
		List<User> results = query.list();
		System.out.println(results.size());
		User user = null;
		if (results.size()>0)
			user = results.get(0);
		transaction.commit();
		hibernateSession.close();
		return user;
	}
	/**
	 * �˷������ڰ�һ��user��һ��activity�����������
	 * ���浽���ݿ���
	 * ��ϵ���û�����������
	 * @param userId Ҫ�������û�id
	 * @param activityId Ҫ����Ļid
	 */
	public void joinActivity(String userId, String activityId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		ActivityDAO actDao=new ActivityDAO();
		Activity act = actDao.getActivity(activityId);
		MemberDAO memDao = new MemberDAO();
		String memberId = memDao.addMember(userId, activityId);
		Member member = memDao.getMember(memberId);
		User user = getUser(userId);
		user.getJoinedActivity().add(act);
		act.getMembers().add(member);
		
		hibernateSession.update(user);
		hibernateSession.update(act);
		
		transaction.commit();
		hibernateSession.close();
	}
	/**
	 * �˷������ڰ�һ��user��һ��activity�����������
	 * ���浽���ݿ���
	 * ��ϵ���û�����������
	 * @param userId Ҫ�������û�id
	 * @param activityId Ҫ����Ļid
	 */
	public void ownActivity(String userId, String activityId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		ActivityDAO actDao=new ActivityDAO();
		Activity act = actDao.getActivity(activityId);
		User user = getUser(userId);
		act.setOwner(user);
		user.getOwnActivity().add(act);
		
		hibernateSession.update(user);
		//hibernateSession.update(act);
		
		transaction.commit();
		hibernateSession.close();
	}
	/**
	 * �˷������ڸ������ݿ���һ���û��������Ϣ
	 * ���ָ�����в���������Ҫ�޸ĵĴ���ԭֵ����
	 * @param userId �û�id
	 * @param username �û���
	 * @param password �û�����
	 * @param sex �û��Ա�
	 * @param nickname �û��ǳ�
	 * @return �ɹ�����idʧ�ܷ���null
	 */
	public String updateUserInfo(String userId, String username ,String password,boolean sex,String nickname) 
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		User user = getUser(userId);

		if(user==null)
			return null;
		
		user.setUserName(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setNickname(nickname);
		
		hibernateSession.update(user);

		transaction.commit();
		hibernateSession.close();
		return user.getId();
	}
	/**
	 * �˷������������ݿ���ɾ��һ���û�����Ϣ
	 * @param userId �û�id
	 */
	public int deleteUser(String userId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		User user = getUser(userId);
		if (!(user.getOwnActivity().isEmpty() 
				&& user.getJoinedActivity().isEmpty()))
			return 0;
		
		
		String hql = "DELETE FROM User U WHERE U.id = :userId";
		Query query = hibernateSession.createQuery(hql);
		query.setParameter("userId", userId);
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		
		transaction.commit();
		hibernateSession.close();
		return result;
	}
}
