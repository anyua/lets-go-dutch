package com.struts.action;

import java.util.HashMap;
import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class Settle {
	private String activityID;
	private Activity act;
	private Map<String,String[]> settledAmount = new HashMap<String,String[]>();
	private Member mem;
	private String shareURL;
	private String flag;
	
	private ActivityDAO actDao=new ActivityDAO();
	//private UserDAO userDao=new UserDAO();
	public String activitySettle(){
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		String userId=(String)httpSession.get("login_userID");
		if(userId==null)
			return "needLogin";

		act=actDao.getActivity(activityID);
		shareURL = "http://localhost:8080/lets_go_dutch/settle?activityID="+activityID+"&flag=2";
		//System.out.println("lalala");
		if(userId.equals(act.getOwner().getId()))
		{
			//System.out.println(activityID+"进入分支");
			//System.out.println(act.getType());
			if(act.getType()==0){
				//System.out.println(act.getType());
				actDao.setActivityType(activityID, 1);
			}
			else if(act.getType()==1){
				//System.out.println(act.getType());
				actDao.setActivityType(activityID, 2);
			}
			//System.out.println(activityID);
			for(Member member: act.getMembers())
			{
				double amount = 0;
				for(Item item:member.getJoinItems())
				{
					amount+=item.getAmount()/item.getNumOfMembers();
				}
				for(Message message:member.getMessages())
				{
					if(message.getType()==1)
						amount+=message.getAmount();
				}
				String[] result=new String[3];
				result[0]=member.getUser().getNickname();
				result[1]=member.getUser().getUserName();
				result[2]=String.valueOf(amount);
				actDao.setMemberAmount(member.getId(), amount);
				settledAmount.put(member.getId(), result);
			}
			return "owner";
		}
		else
		{
			for(Member member:act.getMembers())
			{
				if(member.getUser().getId().equals(userId))
				{
					double amount = 0;
					setMem(member);
					for(Item item:member.getJoinItems())
					{
						amount+=item.getAmount()/item.getNumOfMembers();
					}
					for(Message message:member.getMessages())
					{
						if(message.getType()==1)
							amount+=message.getAmount();
					}
					getMem().setAmount(amount);
					
					return "joinner";
				}
			}
			return "false";
		}
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

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}
}
