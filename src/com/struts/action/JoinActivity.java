package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class JoinActivity {
	private User joinUser = new User();
	private UserDAO userOperation = new UserDAO();
	private ActivityDAO activityOperation = new ActivityDAO();
	
	private String itemId;
	private String activityName;
	private String activityId;
	
	public String joinThisActivtiy() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		String userId=(String)httpSession.get("login_userID");
		String activityId=activityOperation.findActivity(getActivityName());
		userOperation.joinActivity(userId, activityId);
		return "success";
	}

	public String outOfItem()
	{
		System.out.println(itemId+'\t'+activityName);
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		String userId=(String)httpSession.get("login_userID");
		//String activityId=activityOperation.findActivity(getActivityName());
		activityOperation.outOfItem(userId, activityId, itemId);
		return "success";
	}
	
	public User getJoinUser() {
		return joinUser;
	}

	public void setJoinUser(User joinUser) {
		this.joinUser = joinUser;
	}
	
	public UserDAO getUserOperation() {
		return userOperation;
	}

	public void setUserOperation(UserDAO userOperation) {
		this.userOperation = userOperation;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	
}
