<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="createActivity">
	活动名称:<input type="text" name="newActivity.name" ><br>
	活动相关信息:<input type="text" name="newActivity.info" ><br>
	活动开始日期:<input type="text" name="newActivity.createDate" ><br>
	活动结束日期:<input type="text" name="newActivity.endDate" ><br>
	活动最大人数（可选）:<input type="text" name="newActivity.size" ><br>
	<input type="button" id="addItem" value="添加一个新的项目" />
	<div id="addform"></div>
    <input type="submit"  value="提交创建活动" />
</form>
</body>
</html>