<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>???????</title>
</head>
<body>
	活动名称：
	<s:property value="act.name" />
	活动金额：
	<s:property value="act.wholeAmount" />

	我的金额：
	<s:property value="myAmount"/>
	
	付款方式：
	<button>现金</button>
	<button>支付宝</button>
	<button>微信</button>
	
	反馈：
	有疑问？
	<form action="feedBack">
		反馈信息：
		类型
		<input type="select" name="remark">
		内容
		<input type="text" name="remark">
		金额
		<input type="text" name="amount">
		<button>提交</button>
	</form>
</body>
</html>