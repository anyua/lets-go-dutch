<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="signup">
	UserName:<input type="text" name="signup_user.userName" ><br>
	Password:<input type="text" name="signup_user.password" ><br>
	Sex:
<input type="radio" name="signup_user.sex" value=true>Male
<input type="radio" name="signup_user.sex" value=false>Female<br>
	Nickname:<input type="text" name="signup_user.nickname" ><br>
	<button type="submit">Submit</button>
</form>

</body>
</html>