package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class Login {
	private UserDAO userOperation = new UserDAO() ;
	private User login_user = new User();
	
	public String userLogin()
	{
		String findResult;
		findResult = userOperation.findUser(login_user.getUserName(),
								login_user.getPassword());
		if (findResult == null)
			return "false";
		else
		{
			Map<String, Object> httpSession =ActionContext.getContext().getSession();
			httpSession.put("login_userID",findResult);
			return "true";
		}
			
	}

	public User getLogin_user() {
		return login_user;
	}

	public void setLogin_user(User login_user) {
		this.login_user = login_user;
	}

	public UserDAO getUserOperation() {
		return userOperation;
	}

	public void setUserOperation(UserDAO userOperation) {
		this.userOperation = userOperation;
	}

}
