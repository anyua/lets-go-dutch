package com.struts.action;

import com.hbm.dao.*;
import com.hbm.model.*;

public class JoinActivity {
	private User joinUser = new User();
	private UserDAO userOperation = new UserDAO();
	
	public String joinThisActivtiy() {
		return "true";
	}

	public User getJoinUser() {
		return joinUser;
	}

	public void setJoinUser(User joinUser) {
		this.joinUser = joinUser;
	}
	
	public UserDAO getUserOperation() {
		return userOperation;
	}

	public void setUserOperation(UserDAO userOperation) {
		this.userOperation = userOperation;
	}
	
}
