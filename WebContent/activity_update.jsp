<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="updateActivity">
	Activity Information:<br>
	Activity Name:<input type="text" name="updateActivity.name" value="${originalActivity.name}"/><br>
	Activity Info:<input type="text" name="updateActivity.info" value="${originalActivity.info}"/><br>
	Activity CreateDate:<input type="text" name="updateActivity.createDate" value="${originalActivity.createDate}"/><br>
	Activity EndDate:<input type="text" name="updateActivity.endDate" value="${originalActivity.endDate}"/><br>
	Activity wholeAmount:<input type="text" name="updateActivity.wholeAmount" value="${originalActivity.wholeAmount}"/><br>
	Activity Size:<input type="text" name="updateActivity.size" value="${originalActivity.size}"/><br>
	Activity Item1:<br>
	detail:<input type="text" name="newItem1.detial"/> 
	Amount:<input type="text" name="newItem1.amount"/><br>
	Activity Item2:<br>
	detail:<input type="text" name="newItem2.detial"/> 
	Amount:<input type="text" name="newItem2.amount"/><br>
	<button type="submit">Submit</button>
</form>
</body>
</html>