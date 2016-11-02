<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css">

<title>Insert title here</title>
<!-- share.css -->
<link rel="stylesheet" href="dist/css/share.min.css">

<!-- share.js -->
<script src="dist/js/jquery.share.min.js"></script>
<script src="dist/js/social-share.min.js"></script>

<script>
$(document).ready(function(){
  $("button.btn-info").click(function(){
	  $("div."+this.id).toggle();
  });

});
</script>
</head>
<body>
活动信息:<br>
活动状态：<s:if test="updateActivity.type==0">进行中</s:if>
<s:if test="updateActivity.type==1">已结算</s:if><br>
Activity Name:<s:property value="updateActivity.name"/><br>
Activity Info:<s:property value="updateActivity.info"/><br>
Activity CreateDate:<s:property value="updateActivity.createDate"/><br>
Activity EndDate:<s:property value="updateActivity.endDate"/><br>
Activity wholeAmount:<s:property value="updateActivity.wholeAmount"/><br>
Activity Size:<s:property value="updateActivity.size"/><br>
Activity Item:
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th>项目信息</th>
			<th>项目金额</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="updateActivity.Items" id='i'>
			<tr>
				<td><s:property value="#i.detial" /></td>
				<td><s:property value="#i.amount" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<br>
<form action="callUpdateActivity">
	<input type="hidden" name="activityID" value="${activityID}"> 
	<button type="submit">修改活动信息</button>
</form>
<form action="settle">
	<input  type="hidden" name="activityID" value="${activityID}">
	<button type="submit">活动结束，进行结算</button>
</form>

<div class="social-share"  data-disabled="google,twitter,facebook" data-url=<s:property value="shareURL" /> ></div>


<div class="panel panel-primary col-md-3 column">
  <div class="panel-heading">
    <h3 class="panel-title">参与者反馈</h3>
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

<div class="panel panel-primary col-md-3 column">
  <div class="panel-heading">
    <h3 class="panel-title">参与者列表</h3>
  </div>
<s:iterator value="updateActivity.members" id='i'>
昵称：<s:property value="%{#i.user.nickname}" />
<button class="btn btn-info" id=<s:property value="%{#i.id}" />>详细信息</button><br>
<div hidden class="<s:property value="%{#i.id}" />">
用户名：<s:property value="%{#i.user.userName}" />
参加的活动项目：
<table>
<s:iterator value="#i.joinItems" id='j'>
			<tr>
				<td>项目名称<s:property value="#i.detial" /></td>
				<td>项目金额<s:property value="#i.amount" /></td>
			</tr>
</s:iterator>
</table>
</div>
</s:iterator>
</div>

</body>
</html>