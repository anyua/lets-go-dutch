package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class OwnerActivityPage {
	ActivityDAO activityOperation = new ActivityDAO();
	Activity updateActivity = new Activity();
	Activity originalActivity = new Activity();
	Item newItem1 = new Item();
	Item newItem2 = new Item();
	
	public String showActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		updateActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		if (updateActivity == null)
			return "false";
		else
			return "true";
	}
	
	public String callUpdateActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		originalActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		return "success";
	}
	
	public String updateActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		System.out.println(updateActivity.getInfo());
		String updateResult = activityOperation.updateActivityInfo((String)httpSession.get("ActivityID"),
				updateActivity.getName(), 
				updateActivity.getInfo(), 
				updateActivity.getCreateDate(), 
				updateActivity.getEndDate(), 
				updateActivity.getWholeAmount(), 
				updateActivity.getSize());
		System.out.println(newItem1.getDetial());
		activityOperation.addItem((String)httpSession.get("ActivityID"), 
					newItem1.getDetial(),
					newItem1.getAmount());
		activityOperation.addItem((String)httpSession.get("ActivityID"), 
				newItem2.getDetial(),
				newItem2.getAmount());
		
		if(updateResult == null)
			return "false";
		else
			return "true";
	}
	
	public ActivityDAO getActivityOperation() {
		return activityOperation;
	}
	public void setActivityOperation(ActivityDAO activityOperation) {
		this.activityOperation = activityOperation;
	}
	public Activity getUpdateActivity() {
		return updateActivity;
	}
	public void setUpdateActivity(Activity updateActivity) {
		this.updateActivity = updateActivity;
	}

	public Item getNewItem1() {
		return newItem1;
	}

	public void setNewItem1(Item newItem1) {
		this.newItem1 = newItem1;
	}

	public Item getNewItem2() {
		return newItem2;
	}

	public void setNewItem2(Item newItem2) {
		this.newItem2 = newItem2;
	}

	public Activity getOriginalActivity() {
		return originalActivity;
	}

	public void setOriginalActivity(Activity originalActivity) {
		this.originalActivity = originalActivity;
	}
	
}
