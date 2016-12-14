package com.struts.action;

import java.util.Map;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class Login {
	private UserDAO userOperation = new UserDAO() ;
	private User login_user = new User();
	//������ʾ�û�����pageOwner
	private User pageOwner;
	private String activityID;
	private String loginType;
	private int error;
	public String userLogin()
	{
		String findResult;
		try{
			

		findResult = userOperation.findUser(login_user.getUserName(),
								login_user.getPassword());
		if (findResult == null)
		{
			setError(1);
			return "false";
		}
		else
		{
			Map<String, Object> httpSession = ActionContext.getContext().getSession();
			httpSession.put("login_userID",findResult);
			
			if(loginType.isEmpty())
			{
				pageOwner = userOperation.getUser(findResult);
				return "true";
			}
			else if(loginType.equals("1"))
				return "turn2activityInfo";
			else if(loginType.equals("2"))
				return "turn2settle";
			else 
			{
				setError(3);
				return "false";
			}
		}
		}catch(Exception e){
			setError(2);
			return "false";
		}
	}
	public String logout()
	{
		Map<String, Object> httpSession = ActionContext.getContext().getSession();
		httpSession.clear();
		
		
		return "success";
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

	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	public User getPageOwner() {
		return pageOwner;
	}
	public void setPageOwner(User pageOwner) {
		this.pageOwner = pageOwner;
	}
	public int getError() {
		return error;
	}
	public void setError(int error) {
		this.error = error;
	}

}
