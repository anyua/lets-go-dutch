<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
	当前用户信息:<br>
	昵称:<s:property value="pageOwner.nickname"/>
	</div>
	<div class="row"></div>
	<form action="callCreateActivity">
		<button type="submit">创建新活动</button>
	</form>
	<div class="row"></div>
	<div  class="col-md-6 column">
		已创建活动<br>
		<table>
		<thead>
			<tr>
			<th>活动名称</th>
			<th>开始日期</th>
			<th>结束日期</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="ownedActivity" id='o'> 
			<tr>
				<td><s:property value="#o.name"/></td>
				<td><s:property value="#o.createDate"/></td>
				<td><s:property value="#o.endDate"/></td><br>
			</tr>
			</s:iterator>
		</tbody>
		</table>
	</div> 
	
	<div  class="col-md-6 column">
		已加入活动<br>
		<table>
		<thead>
			<tr>
			<th>活动名称</th>
			<th>开始日期</th>
			<th>结束日期</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="joinedActivity" id='j'> 
			<tr>
				<td><s:property value="#o.name"/></td>
				<td><s:property value="#o.createDate"/></td>
				<td><s:property value="#o.endDate"/></td><br>
			</tr>
			</s:iterator>
		</tbody>
		</table>
	</div> 

</body>
</html>