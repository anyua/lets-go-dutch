package com.struts.action;

import java.util.HashMap;
import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;

public class Settle {
	private String activityID;
	private Activity act;
	private Map<String,String[]> settledAmount = new HashMap<String,String[]>();
	
	private ActivityDAO actDao=new ActivityDAO();
	//private UserDAO userDao=new UserDAO();
	public String activitySettle(){
		act=actDao.getActivity(activityID);

		for(Member member: act.getMembers())
		{
			double amount = 0;
			for(Item item:member.getJoinItems())
			{
				amount+=item.getAmount()/item.getNumOfMembers();
			}
			amount+=member.getAmount();
			String[] result=new String[3];
			result[0]=member.getUser().getNickname();
			result[1]=member.getUser().getUserName();
			result[2]=String.valueOf(amount);
			System.out.println();
			settledAmount.put(member.getId(), result);
		}
		return "success";
	}

	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public Activity getAct() {
		return act;
	}

	public void setAct(Activity act) {
		this.act = act;
	}

	public Map<String,String[]> getSettledAmount() {
		return settledAmount;
	}

	public void setSettledAmount(Map<String,String[]> settledAmount) {
		this.settledAmount = settledAmount;
	}
}
