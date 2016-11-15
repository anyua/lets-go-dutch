<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>参与活动的具体的项目</title>
  
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  
  <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
  
  <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css">
  <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style">
  <link rel="stylesheet" href="assets/css/ace-skins.min.css">
  <link rel="stylesheet" href="assets/css/ace-rtl.min.css">
  
  <script src="assets/js/ace-extra.min.js"></script>
</head>
<body class="skin-1">
	<div id="navbar" class="navbar navbar-default          ace-save-state">
		<div class="navbar-container ace-save-state" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="fa fa-cutlery fa-lg" aria-hidden="true"></i> LETS GO DUTCH
				</small>
				</a>
			</div>

			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					<li class="grey"><a href="index"> <i
							class="fa fa-home fa-fw fa-2x" aria-hidden="true"></i> <span
							class="badge badge-grey">Home</span>
					</a></li>
					<li class="purple"><a href="index"> <i
							class="fa fa-book fa-fw fa-2x" aria-hidden="true"></i> <span
							class="badge badge-grey">About</span>
					</a></li>
					<li class="light-blue dropdown-modal"><a
						data-toggle="dropdown" href="#" class="dropdown-toggle"> <img
							class="nav-user-photo" src="assets/images/user.jpg"> <span
							class="user-info"> <small>你好,</small> <s:property
									value="pageOwner.nickname" />
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>
						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="profile"> <i class="fa fa-cog fa-fw"
									aria-hidden="true"></i> profile
							</a></li>
							<li><a href="logout"> <i class="fa fa-sign-out fa-fw"
									aria-hidden="true"></i> logout
							</a></li>
						</ul>
					</li>
				</ul>
			 </div>
		  </div>
	   </div>
		
	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>
		<div id="sidebar"
			class="sidebar                  responsive                    ace-save-state">
			<script type="text/javascript">
				try {
					ace.settings.loadState('sidebar')
				} catch (e) {
				}
			</script>
			<ul class="nav nav-list">
				<li class=""><a href="welcome"> <i
						class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
							Dashboard </span>
				</a> <b class="arrow"></b></li>
				<li class="active"><a href="showJoinedActivity"> <i
						class="menu-icon fa fa-list-alt"></i> <span class="menu-text">
							参加的活动 </span>
				</a> <b class="arrow"></b></li>
				<li class=""><a href="showOwnedActivity"> <i
						class="menu-icon fa fa-calendar"></i> <span class="menu-text">
							创建的活动 </span>
				</a> <b class="arrow"></b></li>
				<li class=""><a href="newActivity"> <i
						class="menu-icon fa fa-pencil"></i> <span class="menu-text">
							新建活动 </span>
				</a> <b class="arrow"></b></li>
				<li class=""><a href="addActivity"> <i
						class="menu-icon fa fa-plus-circle"></i> <span class="menu-text">
							加入活动 </span>
				</a> <b class="arrow"></b></li>
			</ul>

			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i id="sidebar-toggle-icon"
					class="ace-icon fa fa-angle-double-left ace-save-state"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>
		</div>
		
		<div class="main-content">
	      <div class="main-content-inner">
	        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
			  <ul class="breadcrumb">
				<li>
				  <i class="ace-icon fa fa-folder-open home-icon"></i>
				  <a href="#">首页</a>
				</li>
				<li class=""><a href="#">参与的活动</a></li>
				<li class="active">活动项目</li>
			  </ul><!-- /.breadcrumb -->
			</div>		
			<div class="page-content">
			  <div class="page-header"></div>
			  <div class="row">
			    <div class="col-xs-12">
			      <div class="widget-box widget-color-blue2">
			        <div class="widget-header">
			          <h5 class="widget-title bigger lighter">
						<i class="ace-icon fa fa-table"></i>

					  </h5>
			        </div>
			        
			        <div class="widget-body">
			          <div class="widget-main">
			            <div class="table-detail">
	                      <div class="row">
	                          <div class="col-xs-12 col-sm-2">
	                          	<s:if test="updateActivity.type==2">
	                              <a href="#"><img height="50" width="140" class="thumbnail" alt="现金支付" src="assets/images/cash.png" /></a>
	                              <a href="#"><img height="50" width="140" class="thumbnail" alt="支付宝" src="assets/images/wepay.png" /></a>
	                              <a href="#"><img height="50" width="140" class="thumbnail" alt="微信" src="assets/images/alipay.jpg" /></a>
	                          	</s:if>
	                          </div>
	                          <div class="col-xs-12 col-sm-7">
	                              
		                          <div class="profile-user-info profile-user-info-striped">
		 							<div class="profile-info-row">
									  <div class="profile-info-name"> 实际总额  </div>
									  <div class="profile-info-value">
										  <span><s:property value="updateActivity.wholeAmount" /></span>
									  </div>
									</div>
									
									<div class="profile-info-row">
									  <div class="profile-info-name"> 参与人数  </div>
									  <div class="profile-info-value">
										  <span><s:property value="updateActivity.size" /></span>
									  </div>
									</div> 
									
									<div class="profile-info-row">
									  <div class="profile-info-name"> 活动状态  </div>
									  <div class="profile-info-value">
										  <span>
										    <s:if test="updateActivity.type==0">  
												活动进行中
												</s:if> <s:elseif test="updateActivity.type==1">  
												活动结算中
												</s:elseif> <s:else>  
												活动结束  
												</s:else>
										  </span>
									  </div>
									</div> 
									
									<div class="profile-info-row">
									  <div class="profile-info-name"> 个人应付  </div>
									  <div class="profile-info-value">
										  <span>
										    <s:iterator value="updateActivity.Members" id="m">
											  <s:if test="#m.user.id==pageOwner.id">
												<s:property value="#m.amount" />
											  </s:if>
											</s:iterator>
										  </span>
									  </div>
									</div>
									
									<div class="profile-info-row">
									  <div class="profile-info-name"> 活动介绍 </div>
									  <div class="profile-info-value">
										  <span><s:property value="updateActivity.info" /></span>
									  </div>
									</div>  
									              
		                          </div>
	                            </div>
	                          <div class="col-xs-12 col-sm-3">
	                          
	                          <s:if test="updateActivity.type==0">
	                              <div class="space visible-xs"></div>
	                              <h4 class="header blue lighter less-margin">Send a feedback</h4>
	                              
	                              <form class="<s:property value="updateActivity.id"/>">
	                                
	                     			<fieldset>
									  <textarea class="width-100 limited" resize="none" 
									  	name="message.remark" placeholder="Type your feedback…" 
									  	maxlength="20"></textarea>
									</fieldset>
									<div class="hr hr-dotted"></div>
									<div class="clearfix">
									  <input type="text" class="pull-left col-sm-4" id="form-field-1" name="message.amount" placeholder="差额">
									  <button activityid="<s:property value="updateActivity.id"/>"
									  	 class="pull-right btn btn-sm btn-primary btn-white btn-round feedBackButton" type="button">
										  Submit
									    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
									  </button> 
									</div>  
									<input type="hidden" name="activityId" value=<s:property value="updateActivity.id"/>>        
	                              </form>
	                          </s:if>
	                          <s:if test="updateActivity.type==1">
	                              <div class="space visible-xs"></div>
	                              <h4 class="header blue lighter less-margin">Send a feedback</h4>
	                              
	                              <form class="<s:property value="updateActivity.id"/>">
	                                
	                     			<fieldset>
									  <textarea class="width-100 limited" resize="none" 
									  	name="message.remark" placeholder="Type your feedback…" 
									  	maxlength="20"></textarea>
									</fieldset>
									<div class="hr hr-dotted"></div>
									<div class="clearfix">
									  <input type="text" class="pull-left col-sm-4" id="form-field-1" name="message.amount" placeholder="差额">
									  <button activityid="<s:property value="updateActivity.id"/>"
									  	 class="pull-right btn btn-sm btn-primary btn-white btn-round feedBackButton" type="button">
										  Submit
									    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
									  </button> 
									</div>  
									<input type="hidden" name="activityId" value=<s:property value="updateActivity.id"/>>        
	                              </form>
	                          </s:if>
	                            </div>
	                      	</div>
	                      </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="space-24"></div>
			  <div class="row">
			    <div class="col-xs-12">
			      <div class="widget-box widget-color-blue2">
			        <div class="widget-header">
			          <h5 class="widget-title bigger lighter">
						<i class="ace-icon fa fa-table"></i>
							活动项目
					  </h5>
			        </div>
					<div class="widget-body">
					  <div class="widget-main no-padding">
					    <table class="table table-striped table-bordered table-hover">
					      <thead class="thin-border-bottom">
					        <tr>
					          <th>项目名称</th>
					          <th>个人应付</th>
					          <th>Check</th>
					        </tr>
					      </thead>
					      
					      <tbody>
					        <s:iterator value="originalItem" id="i">
					          <tr class="<s:property value="#i.id" />">
					            <td><s:property value="#i.detial" /></td>
					            <td><s:property value="#i.amount" /></td>
					            <td>
					            <s:if test="updateActivity.type==0">
					              <button class="btn btn-warning btn-xs outOfItem" 
					              	activityId="<s:property value="updateActivity.id" />" itemId="<s:property value="#i.id" />">
					              	我没去这个活动
					              </button>
					              </s:if>
					              <s:else>
					              <button class="btn btn-warning btn-xs disabled" 
					              	activityId="<s:property value="updateActivity.id" />" itemId="<s:property value="#i.id" />">
					              	我没去这个活动
					              </button>
					              </s:else>
					            </td>
					        </tr>
					        </s:iterator>
					      </tbody>
					    </table>
					  </div>
					</div> 
			      </div>
			    </div>
			  </div> <!-- row end -->
			  <!--  -->
		    </div>
		  </div>
	    </div>
	    
	    <a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
  
  </div>
  
  <script src="assets/js/jquery-2.1.4.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  
  <script src="assets/js/jquery-ui.custom.min.js"></script>
  <script src="assets/js/jquery.inputlimiter.min.js"></script>
  
  <script src="assets/js/ace-elements.min.js"></script>
  <script src="assets/js/ace.min.js"></script>
  
   <script type="text/javascript">
	   $(document).ready(function(){
			  $("#feedBackButton").click(function(){
				  var url="feedBack"
					  var data=$("form#feedBack").serialize()
					  $.get(url,data,
							  function(response){
							  alert("提交成功"+response.activityId);
				      });
				});
			  $("button.outOfItem").click(function() {
					url = "outOfItem"
					var itemId=$(this).attr("itemId");
					var activityId=$(this).attr("activityId");
					$("tr." + itemId).hide();
					data="itemId="+itemId+"&activityId="+activityId;
					$.get(url, data, function() {
						alert("退出成功");
					});
				});
				$(document).ready(function() {
					$("button.feedBackButton").click(function() {
						var url = "feedBack"
						var activityId=$(this).attr("activityid");
						var data = $("form."+activityId).serialize();
						$.get(url, data, function(response) {
							alert("提交成功" + response.activityId);
						});
					});
				});
		  });
	   jQuery(function($) {
			$('textarea.limited').inputlimiter({
				remText: '%n character%s remaining...',
				limitText: 'max allowed : %n.'
			});
			
		});
   
   </script>

</body>
</html>