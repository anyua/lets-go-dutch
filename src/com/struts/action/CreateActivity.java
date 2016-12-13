package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class CreateActivity {
	ActivityDAO activityOperation = new ActivityDAO();
	Activity newActivity = new Activity();
	UserDAO userOperation = new UserDAO();
	//用来显示用户名的pageOwner
	private User pageOwner;
	private User nowUser = new User(); 
	private String[] detials;
	private double[] amounts;
	private String activityID;
	public String createActivity()
	{
		String newActivityID;
		newActivityID = activityOperation.addActivity(newActivity.getName(),
				newActivity.getInfo(), 
				newActivity.getCreateDate(), 
				newActivity.getEndDate(),
				newActivity.getWholeAmount(),
				newActivity.getSize());
		
		if(newActivityID == null)
			return "false";
		else
		{
			double wholeAmount=0;
			for(int i=0;amounts!=null&&detials!=null&&i<detials.length&&i<amounts.length;i++)
			{
				activityOperation.addItem(newActivityID, detials[i], amounts[i]);
				wholeAmount+=amounts[i];
			}
			
			Map<String, Object> httpSession =ActionContext.getContext().getSession();
			//httpSession.put("ActivityID",newActivityID);
			activityID=newActivityID;
			userOperation.ownActivity((String)httpSession.get("login_userID"),
					newActivityID);
			userOperation.joinActivity((String)httpSession.get("login_userID"),
					newActivityID);
			activityOperation.setAmount(newActivityID, wholeAmount);
			return "true";
		}
			
	}
	
	public String showPageOwnerName() 
	{
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		pageOwner = userOperation.getUser((String)httpSession.get("login_userID"));
		return "success";
	}

	public ActivityDAO getActivityOperation() {
		return activityOperation;
	}

	public void setActivityOperation(ActivityDAO activityOperation) {
		this.activityOperation = activityOperation;
	}

	public Activity getNewActivity() {
		return newActivity;
	}

	public void setNewActivity(Activity newActivity) {
		this.newActivity = newActivity;
	}



	public String[] getDetials() {
		return detials;
	}



	public void setDetials(String[] detials) {
		this.detials = detials;
	}



	public double[] getAmounts() {
		return amounts;
	}



	public void setAmounts(double[] amounts) {
		this.amounts = amounts;
	}



	public User getNowUser() {
		return nowUser;
	}



	public void setNowUser(User nowUser) {
		this.nowUser = nowUser;
	}



	public String getActivityID() {
		return activityID;
	}



	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public User getPageOwner() {
		return pageOwner;
	}

	public void setPageOwner(User pageOwner) {
		this.pageOwner = pageOwner;
	}



}
