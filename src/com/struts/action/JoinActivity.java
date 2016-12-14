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
	private int error;
	
	public String joinThisActivtiy() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		String userId=(String)httpSession.get("login_userID");
		String activityId=activityOperation.findActivity(getActivityName());
		try {
			Activity joinActivity = activityOperation.getActivity(activityId);
			if (joinActivity.getOwner().getId().equals(userId))
			{
				//是活动创建者
				error = 3;
				return "false";
			}
			else {
				for(Member member:joinActivity.getMembers())
				{
					if(member.getUser().getId().equals(userId))
					{
						//已经是活动参与者
						error = 4;
						return "false";
					}
				}
			}
			userOperation.joinActivity(userId, activityId);
		} catch(Exception e){
			//活动没主人。。。
			error = 1;
			e.printStackTrace();
		}
		
		if (activityId != null)
		{
			Activity joinActivity = activityOperation.getActivity(activityId);
			if (joinActivity.getOwner().getId().equals(userId))
			{
				//是活动创建者
				error = 3;
				return "false";
			}
			else {
				for(Member member:joinActivity.getMembers())
				{
					if(member.getUser().getId().equals(userId))
					{
						//已经是活动参与者
						error = 4;
						return "false";
					}
				}
			}
			return "success";
		}
		else {
			//单纯的失败
			error = 2;
			return "false";
		}
			
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

	public int getError() {
		return error;
	}

	public void setError(int error) {
		this.error = error;
	}

	
}
