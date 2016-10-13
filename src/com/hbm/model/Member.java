package com.hbm.model;

import java.util.HashSet;
import java.util.Set;

public class Member {
	private String id;
	private User user;
	private double amount;
	private String info;
	private Activity activity;
	private Set<Item> joinItems = new HashSet<Item>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Set<Item> getJoinItems() {
		return joinItems;
	}
	public void setJoinItems(Set<Item> joinItems) {
		this.joinItems = joinItems;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
}
