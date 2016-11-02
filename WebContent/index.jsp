<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>helloworld</title>
</head>
<body>

<form action="login">
	UserName:<input type="text" name="login_user.userName" ><br>
	Password:<input type="text" name="login_user.password" ><br>
	<input type="hidden" name="activityID" value="${activityID}">
	<input type="hidden" name="flag" value="${flag}">
	<button type="submit">Submit</button>
</form>
<div class="row"></div>
<form action="sign">
		<button type="submit" >Sign Up</button>
</form>
</body>
</html>