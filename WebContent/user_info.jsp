<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row"></div>
	<form action="callCreateActivity">
		<button type="submit">创建新活动</button>
	</form>
	<form action="joinActivity">
		<input type="text" name="activityName" value="活动名称">
		<button type="submit">加入活动</button>
	</form>
	<div class="row"></div>
		<div>
			当前用户信息:<br> 昵称:
			<s:property value="pageOwner.nickname" />
		</div>
		<div>
			<div class="col-md-6 column">
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
								<td><a href="showActivity?activityID=<s:property value="#o.id" />"><s:property value="#o.name" /></a></td>
								<td><s:property value="#o.createDate" /></td>
								<td><s:property value="#o.endDate" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>

			<div class="col-md-6 column">
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
								<td><a href="showActivity?activityID=<s:property value="#j.id" />"><s:property value="#j.name" /></a></td>
								<td><s:property value="#j.createDate" /></td>
								<td><s:property value="#j.endDate" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>