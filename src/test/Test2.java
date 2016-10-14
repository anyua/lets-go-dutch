package test;

import java.util.Date;
import java.util.Iterator;

import com.hbm.dao.*;
import com.hbm.model.*;

public class Test2 {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		UserDAO userDao = new UserDAO();
		
		String username="abc";
		String password="123";
		boolean sex=true;
		String nickname="lalala";
		
		String userId = userDao.addUser(username, password, sex, nickname);
		
		ActivityDAO actDao = new ActivityDAO();
		
		String name = "jucan";
		String info = "zuotian";
		Date createDate = new Date();
		Date endDate = new Date();
		double wholeAmount = 100.101;
		int size = 10;
		
		String activityId = actDao.addActivity(name, info, createDate, endDate, wholeAmount, size);

		Activity act = actDao.getActivity(activityId);
		
		userDao.ownActivity(userId, activityId);
		
		String userId2 = userDao.findUser(username, password);
		
		User user = userDao.getUser(userId);
		

		
		System.out.println(user.getId());
		System.out.println(userId);
		System.out.println(userId2);
		System.out.println(user.getUserName());
		System.out.println(user.getNickname());
		System.out.println(user.getPassword());
		System.out.println("\n");
		
		System.out.println(activityId);
		System.out.println(act.getName());
		//System.out.println(act.getOwner().getId());
		System.out.println("\n");
		
		Activity tempAct;
		Iterator<Activity> it = user.getOwnActivity().iterator();
		while(it.hasNext())
		{
			tempAct = it.next();
			System.out.println(tempAct.getId());
			System.out.println(tempAct.getName());
			System.out.println(tempAct.getOwner().getId());
		}
		
	}

}
