package com.hbm.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Activity {
	private String id;
	private String name;
	private User owner;
	private String info;
	private Date createDate;
	private Date endDate;
	private double wholeAmount;
	private int planNum;
	private int size;
	private int type;
	
	private Set<Member> Members = new HashSet<Member>();
	private Set<Item> Items = new HashSet<Item>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public double getWholeAmount() {
		return wholeAmount;
	}
	public void setWholeAmount(double wholeAmount) {
		this.wholeAmount = wholeAmount;
	}
	public int getPlanNum() {
		return planNum;
	}
	public void setPlanNum(int planNum) {
		this.planNum = planNum;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public Set<Member> getMembers() {
		return Members;
	}
	public void setMembers(Set<Member> members) {
		Members = members;
	}
	public Set<Item> getItems() {
		return Items;
	}
	public void setItems(Set<Item> items) {
		Items = items;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}