package com.struts.action;

import java.util.Map;

import com.hbm.dao.UserDAO;
import com.hbm.model.User;
import com.opensymphony.xwork2.ActionContext;

public class ShowNickName {
	private User pageOwner = new User();
	private UserDAO userOperation = new UserDAO();
	
	public String welcome() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		setPageOwner(userOperation.getUser((String)httpSession.get("login_userID")));	
		System.out.println(getPageOwner().getNickname());
		return "success";
	}
	public String addActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		setPageOwner(userOperation.getUser((String)httpSession.get("login_userID")));	
		return "success";
	}
	public String newActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		setPageOwner(userOperation.getUser((String)httpSession.get("login_userID")));	
		return "success";
	}
	public User getPageOwner() {
		return pageOwner;
	}
	public void setPageOwner(User pageOwner) {
		this.pageOwner = pageOwner;
	}
	
}
