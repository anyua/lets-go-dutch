package com.hbm.model;

import java.util.HashSet;
import java.util.Set;

public class User {
	private String id;
	private String userName;
	private String password;
	private String nickname;
	private boolean sex;
	//sex=true is male
	//sex=false is female
	
	private Set<Activity> joinedActivity = new HashSet<Activity>();
	private Set<Activity> ownActivity = new HashSet<Activity>();
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public Set<Activity> getJoinedActivity() {
		return joinedActivity;
	}

	public void setJoinedActivity(Set<Activity> joinedActivity) {
		this.joinedActivity = joinedActivity;
	}

	public Set<Activity> getOwnActivity() {
		return ownActivity;
	}

	public void setOwnActivity(Set<Activity> ownActivity) {
		this.ownActivity = ownActivity;
	}
	
}
