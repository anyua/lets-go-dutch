package com.hbm.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

/**
* 这个类是用来进行Activity类与数据库操作交互的工具类。
* 不建议以其他方式直接操作数据库中的activity对象，
* 并且操作不同的属性要调用不同的方法
* @author ANYUANZHI
* @version 1.0
*/
public class ActivityDAO extends DAO {
	/**
	  * 这个方法用来在数据库里添加新的活动条目
	  * 初始化除了参数给出的属性其他都为空
	  * @param name 活动名称
	  * @param info 活动信息
	  * @param createDate 活动创建日期
	  * @param enddate 活动结束日期
	  * @param wholeAmount 活动花费总额
	  * @param size 活动容纳人数上限
	  * @return String 数据库中新添加的Activity条目的唯一ID
	  * 如果已包含重复的活动名称或者添加失败返回null
	  */
	public String addActivity(String name,String info,Date createDate,Date endDate,double wholeAmount,int size)
	{
		Session hibernateSessionBefor = factory.openSession();
		Transaction transactionBefor = hibernateSessionBefor.beginTransaction();
		
		String hql2 = "SELECT A.id FROM Activity A WHERE A.name = :name";
		Query query2 = hibernateSessionBefor.createQuery(hql2);
		query2.setParameter("name",name);
		List results2 = query2.list();
		if(results2.size()>0)
			return null;
		
		transactionBefor.commit();
		hibernateSessionBefor.close();
		
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
	/**
	 * 这个方法用于从数据库中取出一个活动的完整信息
	 * 包括，所有关联的item、member、user对象的信息
	 * @param activityId activity对象的唯一标识id，可以通过find方法获取
	 * @return 返回一个activity对象，允许访问不建议直接对此对象进行修改
	 */
	public Activity getActivity(String activityId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		String hql = "FROM Activity A WHERE A.id=:actId";
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
	/**
	 * 这个方法用于获取一个活动的唯一标识id
	 * @param activityName 要查找的活动名称
	 * @return String类型的活动id，可以用于调用其他方法对次对象进行访问和修改
	 */
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
	/**
	 * 此方法用于将一个用户和一个活动关联起来
	 * 关系未此用户加入了此活动
	 * @param activityId 被关联活动的id
	 * @param userId 被关联用户id
	 */
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
	/**
	 * 此方法用于在数据库中已经存储的活动条目中
	 * 加入一个活动项目
	 * 新添加的项目，默认为活动中已有的全部成员都参加了
	 * @param activityId 活动的唯一标识id，可以通过find方法获得
	 * @param itemDetial 要被添加的活动项目文字描述信息
	 * @param itemAmount 被添加的活动项目的花费钱数
	 */
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
	/**
	 * 此方法用于更新数据库中一个活动的相关信息
	 * 务必指定所有参数，不需要修改的传递原值即可
	 * @param activityId 要修改条目的id
	 * @param name 活动名称
	 * @param info 活动信息
	 * @param createDate 活动建立日期
	 * @param endDate 活动结束日期
	 * @param wholeAmount 活动总金额
	 * @param size 活动人数
	 * @return 失败未找到活动返回null否则返回id
	 */
	public String updateActivityInfo(String activityId,String name, String info,Date createDate,Date endDate,double wholeAmount,int size) 
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		Activity act = getActivity(activityId);

		if(act==null)
			return null;
		
		act.setName(name);
		act.setInfo(info);
		act.setCreateDate(createDate);
		act.setEndDate(endDate);
		act.setSize(size);
		act.setWholeAmount(wholeAmount);
		
		hibernateSession.update(act);

		transaction.commit();
		hibernateSession.close();
		return act.getId();
	}
	/**
	 * 此方法用于更新数据库中一个活动的某个条目的相关信息
	 * @param itemId 当前活动的相应条目的id
	 * @param detial 活动信息
	 * @param amount 活动金额
	 * @return 成功返回id 失败返回null
	 */
	public String updateItem(String itemId,String detial,double amount)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		ItemDAO itemDao = new ItemDAO();
		Item item = itemDao.getItem(itemId);

		if(item==null)
			return null;
		
		item.setDetial(detial);
		item.setAmount(amount);
		
		hibernateSession.update(item);

		transaction.commit();
		hibernateSession.close();
		return item.getId();
	}
	/**
	 * 此方法用于在数据库中删除一个item条目
	 * @param itemId
	 * @return 删除的条目数，正常是1
	 */
	public int deleteItem(String itemId)
	{
		ItemDAO itemDao = new ItemDAO();
		int numOfDeleteItem = itemDao.deleteItem(itemId);
		return numOfDeleteItem;
	}
	/**
	 * 此方法用于删除数据库中一个活动的活动项目信息
	 * @param memberId 活动项目id
	 * @return 删除的条目数，正常是1
	 */
	public int deleteMember(String activityId,String userId)
	{
		//还要先删除user下的joinact
		//MemberDAO memberDao = new MemberDAO();
		//int numOfDeleteMember = memberDao.deleteMember(memberId);
		//return numOfDeleteMember;
		//整个函数未测试用的时候再改
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		int i=0;
		Activity act = getActivity(activityId);
		Member member ;
		Iterator<Member> it = act.getMembers().iterator();
		while (it.hasNext())
		{
			member = it.next();
			if (member.getUser().getId()==userId)
			{
				act.getMembers().remove(member);
			}
			i++;
		}
		UserDAO userDao = new UserDAO();
		Activity actTemp ;
		User user = userDao.getUser(userId);
		Iterator<Activity> it2 = user.getJoinedActivity().iterator();
		while (it2.hasNext())
		{
			actTemp = it2.next();
			if (actTemp.getId()==activityId)
			{
				user.getJoinedActivity().remove(actTemp);
			}
		}
		hibernateSession.update(user);
		hibernateSession.update(act);
		transaction.commit();
		hibernateSession.close();
		return i;
	}
	/**
	 * 此方法用于删除整个活动
	 * @param activityId 项目id
	 * @return 删除的条目数，正常是1
	 */
	public void deleteActivity(String activityId)
	{
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		Activity act = getActivity(activityId);
		hibernateSession.delete(act);
		
		transaction.commit();
		hibernateSession.close();
	}
	/**
	 * 
	 * @param userId
	 * @param activityId
	 * @param itemId
	 */
	public void outOfItem(String userId,String activityId,String itemId)
	{
	}
}
