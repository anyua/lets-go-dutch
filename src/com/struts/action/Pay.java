package com.struts.action;

import com.hbm.model.*;
import com.hbm.dao.*;

public class Pay {
	private Activity activity = new Activity();
	private User user = new User();
	private String userID;
	private String activityID;
	private int type;
	private ActivityDAO actDao = new ActivityDAO();
	private UserDAO userDao = new UserDAO();
	public String Pay(){
		user = userDao.getUser(getUserID());
		activity = actDao.getActivity(getActivityID());
		for(Member member : activity.getMembers()){
			if(member.getUser().getId().equals(getUserID())){
				actDao.setMemberType(member.getId(), getType());
				System.out.println(type);
			}
		}
		return "success";
	}
	public String getActivityID() {
		return activityID;
	}
	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
