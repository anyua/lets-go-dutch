package com.struts.action;

import java.util.Map;
import java.util.Set;

import com.hbm.dao.*;
import com.hbm.model.*;
import com.opensymphony.xwork2.ActionContext;

public class OwnerActivityPage {
	ActivityDAO activityOperation = new ActivityDAO();
	UserDAO userOperation = new UserDAO();
	Activity updateActivity = new Activity();
	Activity originalActivity = new Activity();
	private User pageOwner = new User();
	private String[] detials = {};
	private double[] amounts = {};
	private Set<Item> originalItem ;
	private Item updateItem = new Item();
	private int payType;
	private String itemId;
	
	private String activityID;
	private String shareURL;
	private String loginType;
	
	public String showActivity() {
		//System.out.println(activityID);

		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		//updateActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		String userId=(String)httpSession.get("login_userID");
		if(userId==null)
			return "needLogin";
		pageOwner=userOperation.getUser(userId);
		updateActivity = activityOperation.getActivity(activityID);
		shareURL = "http://localhost:8080/lets_go_dutch/showActivity?activityID="+activityID+"&flag=1";
		if (updateActivity == null)
			return "false";
		else 
		{
			if(userId.equals(updateActivity.getOwner().getId()))
				return "owner";
			else
			{
				for(Member member:updateActivity.getMembers())
				{
					if(member.getUser().getId().equals(userId))
					{
						originalItem = member.getJoinItems();
						payType = member.getType();
						break;
					}
				}
				if(originalItem==null){
					userOperation.joinActivity(userId, activityID);
					originalItem=updateActivity.getItems();
					payType = 0;
				}
				return "joiner";
			}
		}
	}
	
	public String callUpdateActivity() {
		//Map<String, Object> httpSession =ActionContext.getContext().getSession();
		//originalActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		originalActivity = activityOperation.getActivity(activityID);
		originalItem = originalActivity.getItems();
		return "success";
	}
	
	public String updateActivity() {
		//Map<String, Object> httpSession =ActionContext.getContext().getSession();
		Activity oldActivity = activityOperation.getActivity(activityID);
		String updateResult = activityOperation.updateActivityInfo(activityID,
				oldActivity.getName(), 
				updateActivity.getInfo(), 
				updateActivity.getCreateDate(), 
				updateActivity.getEndDate(), 
					oldActivity.getWholeAmount(), 
				updateActivity.getSize());
		for(int i=0;i<detials.length&&i<amounts.length;i++)
		{
			activityOperation.addItem(activityID, 
					detials[i],
					amounts[i]);
		}
		
		if(updateResult == null)
			return "false";
		else
			return "true";
	}
	
	public String shareActivity() {
		Map<String, Object> httpSession =ActionContext.getContext().getSession();
		originalActivity = activityOperation.getActivity((String)httpSession.get("ActivityID"));
		if(originalActivity == null)
			return "false";
		else
			return "true";
	}
	
	public String addItem(){
		double wholeAmount = 0;
		for(int i=0;i<detials.length&&i<amounts.length;i++)
		{
			wholeAmount+=amounts[i];
			activityOperation.addItem(activityID, 
					detials[i],
					amounts[i]);
		}
		activityOperation.addWholeAmount(activityID,wholeAmount);
		return "success";
	}
	
	public String updateItem() {
		//System.out.println(updateItem.getDetial());
		//System.out.println(updateItem.getAmount());
		//System.out.println("lalala");
		itemId=updateItem.getId();
		Item item = activityOperation.getItem(itemId);
		double wholeAmount=updateItem.getAmount()-item.getAmount();
		activityOperation.addWholeAmount(activityID, wholeAmount);
		String id = activityOperation.updateItem(updateItem.getId(), 
				updateItem.getDetial(), 
				updateItem.getAmount());
		if (id == null)
			return "false";
		else
			return "true";
	}
	
	public String deleteItem() {
		System.out.println(activityID);

		activityOperation.deleteItem(activityID,updateItem.getId());
		//activityOperation.deleteItem(itemId);
		System.out.println(activityID);
		Activity act=activityOperation.getActivity(activityID);
		if(act.getType()!=0){
			for(Member member: act.getMembers())
			{
				double amount = 0;
				for(Item item:member.getJoinItems())
				{
					amount+=item.getAmount()/item.getNumOfMembers();
				}
				for(Message message:member.getMessages())
				{
					if(message.getType()==1)
						amount+=message.getAmount();
				}
				String[] result=new String[3];
				result[0]=member.getUser().getNickname();
				result[1]=member.getUser().getUserName();
				result[2]=String.valueOf(amount);
				activityOperation.setMemberAmount(member.getId(), amount);
			}
		}
		System.out.println(activityID);

		return "true";
	}
	

	public ActivityDAO getActivityOperation() {
		return activityOperation;
	}
	public void setActivityOperation(ActivityDAO activityOperation) {
		this.activityOperation = activityOperation;
	}
	public Activity getUpdateActivity() {
		return updateActivity;
	}
	public void setUpdateActivity(Activity updateActivity) {
		this.updateActivity = updateActivity;
	}

	public Activity getOriginalActivity() {
		return originalActivity;
	}

	public void setOriginalActivity(Activity originalActivity) {
		this.originalActivity = originalActivity;
	}

	public String[] getDetials() {
		return detials;
	}

	public void setDetials(String[] detials) {
		this.detials = detials;
	}

	public double[] getAmounts() {
		return amounts;
	}

	public void setAmounts(double[] amounts) {
		this.amounts = amounts;
	}

	public Set<Item> getOriginalItem() {
		return originalItem;
	}

	public void setOriginalItem(Set<Item> originalItem) {
		this.originalItem = originalItem;
	}

	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public String getShareURL() {
		return shareURL;
	}

	public void setShareURL(String shareURL) {
		this.shareURL = shareURL;
	}

	public User getPageOwner() {
		return pageOwner;
	}

	public void setPageOwner(User pageOwner) {
		this.pageOwner = pageOwner;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public Item getUpdateItem() {
		return updateItem;
	}

	public void setUpdateItem(Item updateItem) {
		this.updateItem = updateItem;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
}
