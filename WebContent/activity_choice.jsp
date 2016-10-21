<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="createActivity">
	Name:<input type="text" name="newActivity.name" ><br>
	Info:<input type="text" name="newActivity.info" ><br>
	CreateDate:<input type="text" name="newActivity.createDate" ><br>
	EndDate:<input type="text" name="newActivity.endDate" ><br>
	wholeAmount:<input type="text" name="newActivity.wholeAmount" ><br>
	size:<input type="text" name="newActivity.size" ><br>
	
	<button type="submit">创建活动</button>
</form>
</body>
</html>