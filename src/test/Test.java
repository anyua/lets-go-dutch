package test;

import java.util.Date;
import java.util.Iterator;

import com.hbm.dao.*;
import com.hbm.model.*;

public class Test {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		UserDAO userDao = new UserDAO();
		ActivityDAO actDao = new ActivityDAO();
		
		String username="abc";
		String password="123";
		boolean sex=true;
		String nickname="lalala";
		
		String userId = userDao.addUser(username, password, sex, nickname);
		
		
		String name = "jucan";
		String info = "zuotian";
		Date createDate = new Date();
		Date endDate = new Date();
		double wholeAmount = 100.101;
		int size = 10;
		
		String activityId = actDao.addActivity(name, info, createDate, endDate, wholeAmount, size);

		actDao.addItem(activityId, "lalala", 1000);
		
		actDao.userJoinin(activityId, userId);
		
		
		Activity act = actDao.getActivity(activityId);
		
	}

}
