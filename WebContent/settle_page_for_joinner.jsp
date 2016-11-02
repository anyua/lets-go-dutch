<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>???????</title>
<script src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>

<script>
$(document).ready(function(){
  $("#feedBackButton").click(function(){
	  var url="feedBack"
	  var data=$("form#feedBack").serialize()
	  $.get(url,data,
			  function(response){
			  alert("提交成功"+response.activityId);
      });
  });
});
</script>
</head>
<body>
	活动名称：
	<s:property value="act.name" />
	活动金额：
	<s:property value="act.wholeAmount" />

	我的金额：
	<s:property value="mem.amount"/>
	
	付款方式：
	<button>现金</button>
	<button>支付宝</button>
	<button>微信</button>
	
	反馈：
	有疑问？
	<form id="feedBack" >
		反馈信息：
		类型
		input type="select" name="type"
		内容
		<input type="text" name="message.remark">
		金额
		<input type="text" name="message.amount">
		<input type="button" value="提交" id="feedBackButton">
		<input type="hidden" name="activityId" value=<s:property value="act.id"/>>
		
	</form>
</body>
</html>