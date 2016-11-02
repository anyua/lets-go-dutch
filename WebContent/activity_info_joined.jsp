<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("button").click(function(){
	  url="outOfItem"
	  $("tr#"+this.id).hide();
	  data={itemId:this.id,activityName:$("#activityName").html()};
	  $.get(url,data,
			  function(){
			  alert("退出成功");
      });
  });
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
<title>Insert title here</title>
</head>
<body>
Activity Information:<br>
Activity Name:<div id="activityName"><s:property value="updateActivity.name"/></div><br>
Activity Info:<s:property value="updateActivity.info"/><br>
Activity CreateDate:<s:property value="updateActivity.createDate"/><br>
Activity EndDate:<s:property value="updateActivity.endDate"/><br>
Activity wholeAmount:<s:property value="updateActivity.wholeAmount"/><br>
Activity Size:<s:property value="updateActivity.size"/><br>
Activity Item:
<table>
	<thead>
		<tr>
			<th>项目信息</th>
			<th>项目金额</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="originalItem" id='i'>
			<tr id="<s:property value="#i.id" />">
				<td><s:property value="#i.detial" /></td>
				<td><s:property value="#i.amount" /></td>
				<td><button id="<s:property value="#i.id" />">我没去这个活动</button></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<br>
<s:if test="updateActivity.type==1">
<form action="settle">
	<input  type="hidden" name="activityID" value="${activityID}">
	<button type="submit">活动已经结束点击结算</button>
</form>
</s:if>
<form id="feedBack" >
	反馈信息：
	类型
	input type="select" name="type"
	内容
	<input type="text" name="message.remark">
	金额
	<input type="text" name="message.amount">
	<input type="button" value="提交" id="feedBackButton">
	<input type="hidden" name="activityId" value=<s:property value="updateActivity.id"/>>
	
</form>
</body>
</html>