package com.struts.action;

import com.hbm.dao.*;
import com.hbm.model.*;

public class CreateActivity {
	ActivityDAO activityOperation = new ActivityDAO();
	Activity newActivity = new Activity();
	
	public String createActivity()
	{
		String activityID;
		activityID = activityOperation.addActivity(newActivity.getName(),
				newActivity.getInfo(), 
				newActivity.getCreateDate(), 
				newActivity.getEndDate(),
				newActivity.getWholeAmount(),
				newActivity.getSize());
		if(activityID == null)
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

	public Activity getNewActivity() {
		return newActivity;
	}

	public void setNewActivity(Activity newActivity) {
		this.newActivity = newActivity;
	}
}
