package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class Signup {
	private UserDAO userOperation = new UserDAO() ;
	private User signup_user = new User();
	private int error = 0;
	public String signUp()
	{
		String signResult;
		signResult = userOperation.addUser(signup_user.getUserName(), 
						signup_user.getPassword(), 
						signup_user.isSex(), 
						signup_user.getNickname());
		
		if(signResult == null)
		{
			error = 1;
			return "false";
		}
		else
		{
			Map<String, Object> httpSession =ActionContext.getContext().getSession();
			httpSession.put("login_userID",signResult);
			return "true";
		}
			
	}
	
	public User getSignup_user() {
		return signup_user;
	}

	public void setSignup_user(User signup_user) {
		this.signup_user = signup_user;
	}
	
	public UserDAO getUserOperation() {
		return userOperation;
	}
	public void setUserOperation(UserDAO userOperation) {
		this.userOperation = userOperation;
	}

	public int getError() {
		return error;
	}

	public void setError(int error) {
		this.error = error;
	}

	
	
	
}
