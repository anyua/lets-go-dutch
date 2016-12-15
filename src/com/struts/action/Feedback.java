package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class Feedback {
	private UserDAO userdao = new UserDAO();
	private ActivityDAO activitydao=new ActivityDAO();
	
	private Message message = new Message();
	
	private String activityId;
	private String messageId;
	
	public String askForAmount()
	{
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		String userId=(String)httpSession.get("login_userID");

		Activity act = activitydao.getActivity(activityId);
		String memberId=null;
		for(Member member: act.getMembers())
		{
			if(member.getUser().getId().equals(userId))
				memberId=member.getId();
		}
		
		userdao.addMessage(memberId, userId, message.getType(), message.getRemark(), message.getAmount());
		double wholeAmount = message.getAmount();
		activitydao.addWholeAmount(activityId, wholeAmount);
		return "success";
	}
	
	public String acceptFeedback(){
		activitydao.setFeedbackType(getMessageId(), 1);
		return "success";
	}
	public String refuseFeedback(){
		activitydao.setFeedbackType(getMessageId(), 2);
		return "success";
	}
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
}
