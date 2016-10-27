<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Activity Information:<br>
Activity Name:<s:property value="updateActivity.name"/><br>
Activity Info:<s:property value="updateActivity.info"/><br>
Activity CreateDate:<s:property value="updateActivity.createDate"/><br>
Activity EndDate:<s:property value="updateActivity.endDate"/><br>
Activity wholeAmount:<s:property value="updateActivity.wholeAmount"/><br>
Activity Size:<s:property value="updateActivity.size"/><br>
Activity Item:
<table>
	<thead>
		<tr>
			<th>项目信息</th>
			<th>项目金额</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="updateActivity.Items" id='i'>
			<tr>
				<td><s:property value="#i.detial" /></td>
				<td><s:property value="#i.amount" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<br>
<form action="callUpdateActivity">
	<input type="hidden" name="activityID" value="${activityID}"> 
	<button type="submit">Edit</button>
</form>
<form action="shareActivity">
	<input type="hidden" name="newActivity.id" value="${activityID}"> 
	<button type="submit">Share it</button>
</form>
</body>
</html>