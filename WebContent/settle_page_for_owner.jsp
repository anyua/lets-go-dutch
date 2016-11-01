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

	<table>
	<s:iterator value="settledAmount" id="x">
		<tr>
			<td><s:property value="#x" /></td>
			<td><s:property value="key" /></td>
			<s:iterator value="value" id="s">
				<td><s:property value="#s" /></td>
			</s:iterator>
		</tr>
	</s:iterator>
	</table>
</body>
</html>