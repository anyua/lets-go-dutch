<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var i=0;
	$("#addItem").click(function(){
		i=i+1;
    	$("#addform").append("<tr><td>"+i+"</td><td><input id=\"itemdetials\" name=\"detials\" type=\"text\" value=\"项目信息\"></td><td><input name=\"amounts\" type=\"text\" value=\"项目金额\"></td></tr>");
	});
});
</script>
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
	<s:iterator value="originalItem" var="x">
		<td><s:property value="#x.detial" /></td>
		<td><s:property value="#x.amount" /></td>
	</s:iterator>
	
	<input type="button" id="addItem" value="添加项目" />
	<div id="addform"></div>
	<button type="submit">Submit</button>
</form>
</body>
</html>