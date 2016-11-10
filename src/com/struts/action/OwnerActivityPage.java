package com.struts.action;

import java.util.Map;
import java.util.Set;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class OwnerActivityPage {
	ActivityDAO activityOperation = new ActivityDAO();
	UserDAO userOperation = new UserDAO();
	Activity updateActivity = new Activity();
	Activity originalActivity = new Activity();
	private String[] detials;
	private double[] amounts;
	private Set<Item> originalItem ;
	
	private String activityID;
	private String shareURL;
	private String flag;
	
	public String showActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		//updateActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		String userId=(String)httpSession.get("login_userID");
		if(userId==null)
			return "needLogin";
		updateActivity = activityOperation.getActivity(activityID);
		shareURL = "http://localhost:8080/lets_go_dutch/showActivity?activityID="+activityID+"&flag=1";
		if (updateActivity == null)
			return "false";
		else 
		{
			if(userId.equals(updateActivity.getOwner().getId()))
				return "owner";
			else
			{
				for(Member member:updateActivity.getMembers())
				{
					if(member.getUser().getId().equals(userId))
					{
						originalItem = member.getJoinItems();
						//System.out.println(member.getId());
						break;
					}
				}
				if(originalItem==null){
					userOperation.joinActivity(userId, activityID);
					originalItem=updateActivity.getItems();
				}
				return "joiner";
			}
		}
	}
	
	
	public String callUpdateActivity() {
		//Map<String, Object> httpSession =ActionContext.getContext().getSession();
		//originalActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		originalActivity = activityOperation.getActivity(activityID);
		originalItem = originalActivity.getItems();
		return "success";
	}
	
	public String updateActivity() {
		//Map<String, Object> httpSession =ActionContext.getContext().getSession();
		//System.out.println(updateActivity.getInfo());
		System.out.println(activityID);
		String updateResult = activityOperation.updateActivityInfo(activityID,
				updateActivity.getName(), 
				updateActivity.getInfo(), 
				updateActivity.getCreateDate(), 
				updateActivity.getEndDate(), 
				updateActivity.getWholeAmount(), 
				updateActivity.getSize());
		for(int i=0;i<detials.length&&i<amounts.length;i++)
		{
			activityOperation.addItem(activityID, 
					detials[i],
					amounts[i]);
		}
		
		if(updateResult == null)
			return "false";
		else
			return "true";
	}
	
	public String shareActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		originalActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		if(originalActivity == null)
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

	public Activity getOriginalActivity() {
		return originalActivity;
	}

	public void setOriginalActivity(Activity originalActivity) {
		this.originalActivity = originalActivity;
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

	public Set<Item> getOriginalItem() {
		return originalItem;
	}

	public void setOriginalItem(Set<Item> originalItem) {
		this.originalItem = originalItem;
	}

	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public String getShareURL() {
		return shareURL;
	}

	public void setShareURL(String shareURL) {
		this.shareURL = shareURL;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
