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

		String detial = "lalala";
		double amount =100;
		
		actDao.addItem(activityId, detial, amount);
		
		userDao.joinActivity(userId, activityId);
		
		
	}

}
