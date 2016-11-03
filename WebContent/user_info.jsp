<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css">
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
			<div class="panel panel-default">
 			 <div class="panel-heading">已创建活动</div>
 			 <div class="panel-body">
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th>活动名称</th>
							<th>开始日期</th>
							<th>结束日期</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="ownedActivity" id='o'>
							<s:if test="#o.type==0">
							<tr class="danger">
								<td><a href="showActivity?activityID=<s:property value="#o.id" />"><s:property value="#o.name" /></a></td>
								<td><s:property value="#o.createDate" /></td>
								<td><s:property value="#o.endDate" /></td>
							</tr>
							</s:if>
							<s:if test="#o.type==1">
							<tr class="success">
								<td><a href="showActivity?activityID=<s:property value="#o.id" />"><s:property value="#o.name" /></a></td>
								<td><s:property value="#o.createDate" /></td>
								<td><s:property value="#o.endDate" /></td>
							</tr>
							</s:if>
						</s:iterator>
					</tbody>
				</table>
				  </div>
				</div>
			</div>
			<div class="col-md-6 column">
						<div class="panel panel-default">
 			 <div class="panel-heading">已加入活动</div>
 			 <div class="panel-body">
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th>活动名称</th>
							<th>开始日期</th>
							<th>结束日期</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="joinedActivity" id='j'>
							<s:if test="#j.type==0">
							<tr class="danger">
								<td><a href="showActivity?activityID=<s:property value="#j.id" />"><s:property value="#j.name" /></a></td>
								<td><s:property value="#j.createDate" /></td>
								<td><s:property value="#j.endDate" /></td>
							</tr>
							</s:if>
							<s:if test="#j.type==1">
							<tr class="success">
								<td><a href="showActivity?activityID=<s:property value="#j.id" />"><s:property value="#j.name" /></a></td>
								<td><s:property value="#j.createDate" /></td>
								<td><s:property value="#j.endDate" /></td>
							</tr>
							</s:if>
						</s:iterator>
					</tbody>
				</table>
				</div>
				</div>
			</div>
		</div>
</body>
</html>