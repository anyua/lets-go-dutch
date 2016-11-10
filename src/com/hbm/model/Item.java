package com.hbm.model;


public class Item {
	private String id;
	private String detial;
	private double amount;
	private int numOfMembers;
	private Activity activity;
	private double aaAmount = amount/(numOfMembers>0?numOfMembers:1);

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDetial() {
		return detial;
	}
	public void setDetial(String detial) {
		this.detial = detial;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getNumOfMembers() {
		return numOfMembers;
	}
	public void setNumOfMembers(int numOfMembers) {
		this.numOfMembers = numOfMembers;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public double getAaAmount() {
		return aaAmount;
	}

	public void setAaAmount(double aaAmount) {
		this.aaAmount = aaAmount;
	}

	
}
