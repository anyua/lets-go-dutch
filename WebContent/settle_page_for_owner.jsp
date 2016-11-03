<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>???????</title>
<script src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css">

<!-- share.css -->
<link rel="stylesheet" href="dist/css/share.min.css">

<!-- share.js -->
<script src="dist/js/jquery-share.min.js"></script>
<script src="dist/js/social-share.min.js"></script>

</head>
<body>
	活动名称：
	<s:property value="act.name" />
	活动总金额：
	<s:property value="act.wholeAmount" />

	<table>
	<tr>
		<th>用户名</th>
		<th>昵称</th>
		<th>AA金额</th>
	</tr>
	<s:iterator value="settledAmount" id="x">
		<tr>
			<s:iterator value="value" id="s">
				<td><s:property value="#s" /></td>
			</s:iterator>
		</tr>
	</s:iterator>
	</table>
	
	<div class="social-share"  data-disabled="google,twitter,facebook" data-url=<s:property value="shareURL" /> ></div>
	
	<div class="panel panel-primary col-md-3 column">
  <div class="panel-heading">
    <h3 class="panel-title">继续接受反馈</h3>
  </div>
  <div class="panel-body">
  	<s:iterator value="updateActivity.members" id='i'>
		<s:iterator value="#i.messages" id='j'>
    <div class="alert alert-dismissible alert-danger">
  	<button type="button" class="close" data-dismiss="alert">&times;</button>
	  发送者：<s:property value="%{#i.user.nickname}" />金额：<s:property value="#j.amount" />备注：<s:property value="#j.remark" />
	<br><button>接受</button>	<button>拒绝</button>
	</div>
			</s:iterator>
	</s:iterator>
  </div>
</div>
</body>
</html>