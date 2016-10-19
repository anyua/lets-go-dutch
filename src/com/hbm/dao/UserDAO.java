package com.hbm.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

/**
 * 这个类是用来进行User类与数据库操作交互的工具类。
 * 不建议以其他方式直接操作数据库中的User对象，
 * 并且操作不同的属性要调用不同的方法
 * @author ANYUANZHI
 * @version 1.0
 */
public class UserDAO extends DAO {
	/**
	 * 此方法用于向数据库中添加一个新的user条目
	 * 初始化除了方法参数中提供的变量其他为空
	 * @param username 新用户姓名
	 * @param password 新用户密码
	 * @param sex 性别
	 * @param nickname 昵称
 	 * @return 如果数据库中没有用户名重复的条目并且添加成功返回唯一id，否则返回null
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
	 * 此方法用于根据用户名和对应的密码从数据库中
	 * 提取相应用户的唯一标识ID
	 * @param username 用户名
	 * @param password 对应密码
	 * @return 返回标识id，没有找到返回null
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
	 * 此方法用于通过用户id从数据库中得到一个完整User
	 * 对象的全部信息，包括关联的活动等，id可以通过find方法得到
	 * @param userId 用户id
	 * @return 一个user对象
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
	 * 此方法用于把一个user和一个activity对象关联起来
	 * 并存到数据库中
	 * 关系是用户加入了这个活动
	 * @param userId 要加入活动的用户id
	 * @param activityId 要加入的活动id
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
	 * 此方法用于把一个user和一个activity对象关联起来
	 * 并存到数据库中
	 * 关系是用户创建了这个活动
	 * @param userId 要加入活动的用户id
	 * @param activityId 要加入的活动id
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
	 * 此方法用于更新数据库中一个用户的相关信息
	 * 务必指定所有参数，不需要修改的传递原值即可
	 * @param userId 用户id
	 * @param username 用户名
	 * @param password 用户密码
	 * @param sex 用户性别
	 * @param nickname 用户昵称
	 * @return 成功返回id失败返回null
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
	 * 此方法用于在数据库中删除一个用户的信息
	 * @param userId 用户id
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
