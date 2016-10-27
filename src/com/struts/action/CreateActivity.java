package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class CreateActivity {
	ActivityDAO activityOperation = new ActivityDAO();
	Activity newActivity = new Activity();
	UserDAO userOperation = new UserDAO();
	User nowUser = new User(); 
	private String[] detials;
	private double[] amounts;
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
			for(int i=0;i<detials.length&&i<amounts.length;i++)
			{
				activityOperation.addItem(newActivityID, detials[i], amounts[i]);
			}
			
			Map<String, Object> httpSession =ActionContext.getContext().getSession();
			httpSession.put("ActivityID",newActivityID);
			userOperation.ownActivity((String)httpSession.get("login_userID"),
					newActivityID);
			return "true";
		}
			
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
}
