package com.hbm.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hbm.model.*;

/**
* ���������������Activity�������ݿ���������Ĺ����ࡣ
* ��������������ʽֱ�Ӳ������ݿ��е�activity����
* ���Ҳ�����ͬ������Ҫ���ò�ͬ�ķ���
* @author ANYUANZHI
* @version 1.0
*/
public class ActivityDAO extends DAO {
	/**
	  * ����������������ݿ�������µĻ��Ŀ
	  * ��ʼ�����˲�������������������Ϊ��
	  * @param name �����
	  * @param info ���Ϣ
	  * @param createDate ���������
	  * @param enddate ���������
	  * @param wholeAmount ������ܶ�
	  * @param size �������������
	  * @return String ���ݿ�������ӵ�Activity��Ŀ��ΨһID
	  * ����Ѱ����ظ��Ļ���ƻ������ʧ�ܷ���null
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
	 * ����������ڴ����ݿ���ȡ��һ�����������Ϣ
	 * ���������й�����item��member��user�������Ϣ
	 * @param activityId activity�����Ψһ��ʶid������ͨ��find������ȡ
	 * @return ����һ��activity����������ʲ�����ֱ�ӶԴ˶�������޸�
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
	 * ����������ڻ�ȡһ�����Ψһ��ʶid
	 * @param activityName Ҫ���ҵĻ����
	 * @return String���͵Ļid���������ڵ������������Դζ�����з��ʺ��޸�
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
	 * �˷������ڽ�һ���û���һ�����������
	 * ��ϵδ���û������˴˻
	 * @param activityId ���������id
	 * @param userId �������û�id
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
	 * �˷������������ݿ����Ѿ��洢�Ļ��Ŀ��
	 * ����һ�����Ŀ
	 * ����ӵ���Ŀ��Ĭ��Ϊ������е�ȫ����Ա���μ���
	 * @param activityId ���Ψһ��ʶid������ͨ��find�������
	 * @param itemDetial Ҫ����ӵĻ��Ŀ����������Ϣ
	 * @param itemAmount ����ӵĻ��Ŀ�Ļ���Ǯ��
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
	 * �˷������ڸ������ݿ���һ����������Ϣ
	 * ���ָ�����в���������Ҫ�޸ĵĴ���ԭֵ����
	 * @param activityId Ҫ�޸���Ŀ��id
	 * @param name �����
	 * @param info ���Ϣ
	 * @param createDate ���������
	 * @param endDate ���������
	 * @param wholeAmount ��ܽ��
	 * @param size �����
	 * @return ʧ��δ�ҵ������null���򷵻�id
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
	 * �˷������ڸ������ݿ���һ�����ĳ����Ŀ�������Ϣ
	 * @param itemId ��ǰ�����Ӧ��Ŀ��id
	 * @param detial ���Ϣ
	 * @param amount ����
	 * @return �ɹ�����id ʧ�ܷ���null
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
	 * �˷������������ݿ���ɾ��һ��item��Ŀ
	 * @param itemId
	 * @return ɾ������Ŀ����������1
	 */
	public int deleteItem(String itemId)
	{
		ItemDAO itemDao = new ItemDAO();
		int numOfDeleteItem = itemDao.deleteItem(itemId);
		return numOfDeleteItem;
	}
	/**
	 * �˷�������ɾ�����ݿ���һ����Ļ��Ŀ��Ϣ
	 * @param memberId ���Ŀid
	 * @return ɾ������Ŀ����������1
	 */
	public int deleteMember(String activityId,String userId)
	{
		//��Ҫ��ɾ��user�µ�joinact
		//MemberDAO memberDao = new MemberDAO();
		//int numOfDeleteMember = memberDao.deleteMember(memberId);
		//return numOfDeleteMember;
		//��������δ�����õ�ʱ���ٸ�
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
	 * �˷�������ɾ�������
	 * @param activityId ��Ŀid
	 * @return ɾ������Ŀ����������1
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
