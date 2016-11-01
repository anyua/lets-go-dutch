package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class Feedback {
	private UserDAO userdao=new UserDAO();
	private Message message = new Message();
	
	private String activityId;
	
	public String askForAmount()
	{
		System.out.println("OK");
		System.out.println(activityId);

		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		String userId=(String)httpSession.get("login_userID");

		userdao.addMessage(activityId, userId, message.getType(), message.getId(), message.getAmount());
		
		return "success";
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
}
