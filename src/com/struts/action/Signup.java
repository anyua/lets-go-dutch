package com.struts.action;

import com.hbm.dao.*;
import com.hbm.model.*;

public class Signup {
	private UserDAO userOperation = new UserDAO() ;
	private User signup_user = new User();
	
	public String signUp()
	{
		String signResult;
		signResult = userOperation.addUser(signup_user.getUserName(), 
						signup_user.getPassword(), 
						signup_user.isSex(), 
						signup_user.getNickname());
		if(signResult == null)
			return "false";
		else
			return "true";
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

	
	
	
}
