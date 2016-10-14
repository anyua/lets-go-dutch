package test;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.hbm.model.*;

public class Test {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		final Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
		final StandardServiceRegistryBuilder srb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
		final SessionFactory factory = cfg.buildSessionFactory(srb.build());
		
		Session hibernateSession = factory.openSession();
		Transaction transaction = hibernateSession.beginTransaction();
		
		User newuser = new User();
		User newuser2 = new User();
		Activity newAct = new Activity();
		Item newItem = new Item();
		Member newMember = new Member();
		newuser2.setUserName("000000");
		newuser2.setPassword("111111");
		newuser2.setSex(false);
		newuser2.setNickname("bbb");
		newuser.setUserName("lalala");
		newuser.setPassword("123");
		newuser.setSex(false);
		newuser.setNickname("aaa");
		newAct.setName("ppp");
		newAct.setSize(10);
		newAct.setOwner(newuser);
		newAct.setInfo("laskjfjdsflkjsdfj");
		newItem.setActivity(newAct);
		newItem.setAmount(100.01);
		newItem.setDetial("xxx");
		newAct.getItems().add(newItem);
		newMember.setActivity(newAct);
		newMember.setAmount(100);
		newMember.setUser(newuser2);
		newMember.getJoinItems().add(newItem);
		newAct.getMembers().add(newMember);
		newuser.getOwnActivity().add(newAct);
		newuser2.getJoinedActivity().add(newAct);
		
		hibernateSession.save(newuser);
		hibernateSession.save(newAct);
		hibernateSession.save(newMember);
		hibernateSession.save(newuser2);
		hibernateSession.save(newItem);
		String hql = "SELECT U.id FROM User U WHERE U.userName='lalala'";
		Query query = hibernateSession.createQuery(hql);
		List results = query.list();
		System.out.println(results.get(0).toString());
		
		hql = "FROM User U WHERE U.id=:userId";
		query = hibernateSession.createQuery(hql);
		query.setParameter("userId",results.get(0).toString());
		results = query.list();
		User user;
		user = (User) results.get(0);
		Iterator<Activity> it = user.getOwnActivity().iterator();
		System.out.println(user.getUserName()+user.getId()+it.next().getName());
		transaction.commit();
		hibernateSession.close();
	}

}
