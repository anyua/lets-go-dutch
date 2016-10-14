package com.struts.action;

import com.hbm.dao.*;
import com.hbm.model.*;

public class Login {
	private UserDAO userOperation = new UserDAO() ;
	private User login_user = new User();
	
	public String userLogin()
	{
		String findResult;
		System.out.println(login_user.getUserName());
		System.out.println(login_user.getPassword());
		findResult = userOperation.findUser(login_user.getUserName(),
								login_user.getPassword());
		System.out.println(findResult);
		if (findResult == null)
			return "false";
		else
			return "true";
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
