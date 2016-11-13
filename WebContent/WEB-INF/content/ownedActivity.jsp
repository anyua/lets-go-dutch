<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建的活动</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css">  -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />

<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css">
<link rel="stylesheet" href="assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style">
<link rel="stylesheet" href="assets/css/ace-skins.min.css">
<link rel="stylesheet" href="assets/css/ace-rtl.min.css">
<link rel="stylesheet" href="assets/css/share.min.css">

<script src="assets/js/ace-extra.min.js"></script>
<style type="text/css">
body {
	background: url(assets/images/2.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-weight: 400;
	font-size: 14px;
	letter-spacing: 0.04em;
}

.overlay {
	background-color: #111;
	opacity: 0.4;
	position: fixed;
	-webkit-transform: translateZ(0);
	top: 0px;
	left: 0px;
	right: 0px;
	width: 100%;
	height: 100%;
}
</style>

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
							class="user-info"> <small>Welcome,</small> <s:property
									value="pageOwner.nickname" />
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>
						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="profile"> <i class="fa fa-cog fa-fw"
									aria-hidden="true"></i> Profile
							</a></li>
							<li><a href="logout"> <i class="fa fa-sign-out fa-fw"
									aria-hidden="true"></i> Logout
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
		try{ace.settings.loadState('main-container')}catch(e){}
	</script>
		<div id="sidebar"
			class="sidebar                  responsive                    ace-save-state">
			<script type="text/javascript">
		try{ace.settings.loadState('sidebar')}catch(e){}
      </script>
			<ul class="nav nav-list">
				<li class="active"><a href="#"> <i
						class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
							Dashboard </span>
				</a> <b class="arrow"></b></li>
				<li class=""><a href="showJoinedActivity"> <i
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
						<li><i class="ace-icon fa fa-folder-open home-icon"></i> <a
							href="#">首页</a></li>
						<li class="active">创建的活动</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="page-header"></div>
					<div class="row">
						<div class="col-xs-12">
							<table id="simple-table"
								class="table  table-bordered table-hover">
								<thead>
									<tr>
										<th class="detail-col">Details</th>
										<th>活动名称</th>
										<th>开始日期</th>
										<th>结束日期</th>
										<th>活动状态</th>
										<th></th>
									</tr>
								</thead>

								<tbody>
									<s:iterator value="ownedActivity" id="a">
										<tr class="<s:property value="#a.id"/>">

											<td class="center">
												<div class="action-buttons">
													<a href="#" class="green bigger-140 show-details-btn"
														title="Show Details"> <i
														class="ace-icon fa fa-angle-double-down"></i> <span
														class="sr-only">Details</span>
													</a>
												</div>
											</td>

											<td><a
												href="showActivity?activityID=<s:property value="#a.id"/>"><s:property
														value="#a.name" /></a></td>
											<td class="createDate"><s:property value="#a.createDate" /></td>
											<td class="endDate"><s:property value="#a.endDate" /></td>
											<td class="activityType <s:property value="#a.id"/>"><s:if test="#a.type==0">  
												活动进行中
												</s:if> <s:elseif test="#a.type==1">  
												活动结算中
												</s:elseif> <s:else>  
												活动结束  
												</s:else>
											</td>
											<td>
												<div class="hidden-sm hidden-xs btn-group">
													<s:if test="#a.type==0">
													<a href="#" type="button" class="btn btn-xs btn-success <s:property value="#a.id"/>"
														title="Settle" actId=<s:property value="#a.id"/>> <i
														class="ace-icon fa fa-check bigger-120"></i>
													</a>
													</s:if>
													<s:elseif test="#a.type==1"> 
													<a href="#" type="button" class="btn btn-xs btn-primary <s:property value="#a.id"/>"
														title="Settle" actId=<s:property value="#a.id"/>> <i
														class="ace-icon fa fa-check bigger-120"></i>
													</a>
													</s:elseif>
													<s:else> 
													<a href="#" type="button" class="btn btn-xs btn-default disabled <s:property value="#a.id"/>"
														title="Settle" actId=<s:property value="#a.id"/>> <i
														class="ace-icon fa fa-check bigger-120"></i>
													</a>
													</s:else>
													<a href="#" type="button" class="btn btn-xs btn-info"
														title="Edit" data-toggle="modal" data-target="#myModal1"
														actId=<s:property value="#a.id"/>> <i
														class="ace-icon fa fa-pencil bigger-120"></i>
													</a> 
													<a href="#" type="button" class="btn btn-xs btn-danger"
														title="Delete" actId=<s:property value="#a.id"/>> <i
														class="ace-icon fa fa-trash-o bigger-120"></i>
													</a> 
													<a href="#" type="button" class="btn btn-xs btn-warning shareButton"
														title="share" data-toggle="modal" data-target="#myModal<s:property value="#a.id"/>"
														actId=<s:property value="#a.id"/>> <i
														class="ace-icon fa fa-share-alt bigger-120"></i>
													</a>
													<div class="modal fade" style="position: fixed;" id="myModal<s:property value="#a.id"/>"
														tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal"
																		aria-hidden="true">&times;</button>
																	<h4 class="modal-title" id="myModalLabel">分享</h4>
																</div>
																<div class="modal-body">
																	<div class="social-share" data-disabled="google,twitter,facebook" 
																	data-url="http://app.kimbap.ninja/showActivity?activityID=<s:property value="#a.id"/>&loginType=1">
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle"
															data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>

														<ul
															class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<s:if test="#a.type==0">  
															<li><a href="#" class="tooltip-success <s:property value="#a.id"/>"
																data-rel="tooltip" title="Settle"
																actId=<s:property value="#a.id"/>> <span
																	class="blue"> <i
																		class="ace-icon fa fa-check bigger-120"></i>
																</span>
															</a></li>
															</s:if> <s:elseif test="#a.type==1">  
															<li><a href="#" class="tooltip-primary <s:property value="#a.id"/>"
																data-rel="tooltip" title="Settle"
																actId=<s:property value="#a.id"/>> <span
																	class="blue"> <i
																		class="ace-icon fa fa-check bigger-120"></i>
																</span>
															</a></li>
															</s:elseif> <s:else>  
															<li><a href="#" class="tooltip-defalut <s:property value="#a.id"/>"
																data-rel="tooltip" title="Settle"
																actId=<s:property value="#a.id"/>> <span
																	class="blue"> <i
																		class="ace-icon fa fa-check bigger-120"></i>
																</span>
															</a></li> 
															</s:else>
															

															<li><a href="#" class="tooltip-info"
																data-rel="tooltip" title="Edit" data-toggle="modal"
																data-target="#myModal1"
																actId=<s:property value="#a.id"/>> <span
																	class="green"> <i
																		class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																</span>
															</a></li>

															<li><a href="#" class="tooltip-error"
																data-rel="tooltip" title="Delete"
																actId=<s:property value="#a.id"/>> <span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</span>
															</a></li>
															<li><a href="#" class="tooltip-error shareButton"
																data-rel="tooltip" title="Share" data-toggle="modal"
																data-target="#myModal" actId=<s:property value="#a.id"/>>
																	<span class="red"> <i
																		class="ace-icon fa fa-share-alt bigger-120"></i>
																</span>
															</a></li>
														</ul>

													</div>
												</div>
											</td>

										</tr>
										<tr class="detail-row <s:property value="#a.id"/>">
											<td colspan="7">
												<div class="table-detail">
													<div class="row">
														<div class="col-xs-12 col-sm-6">

															<div class="profile-user-info profile-user-info-striped">

																<div class="profile-info-row">
																	<div class="profile-info-name">实际金额</div>
																	<div class="profile-info-value">
																		<span class="wholeAmount"><s:property
																				value="#a.wholeAmount" /></span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">参与人数</div>
																	<div class="profile-info-value">
																		<span class="size"><s:property value="#a.size" /></span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">活动介绍</div>
																	<div class="profile-info-value">
																		<span class="info"><s:property value="#a.info" /></span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</s:iterator>

								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" style="position: fixed;" id="myModal1"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">编辑</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="updateActivity" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 参与人数 </label>
								<div class="col-sm-9">
									<input type="text" class="input-sm" id="spinner2"
										name="updateActivity.size" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="id-date-picker-1"> 起始日期 </label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-xs-10 col-sm-4">
											<div class="input-group">
												<input type="text" class="form-control date-picker"
													id="id-date-picker-1" name="updateActivity.createDate"
													data-date-format="yyyy-mm-dd" /> <span
													class="input-group-addon"> <i
													class="fa fa-calendar bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="id-date-picker-1"> 终止日期 </label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-xs-10 col-sm-4">
											<div class="input-group">
												<input type="text" class="form-control date-picker"
													id="id-date-picker-1" name="updateActivity.endDate"
													data-date-format="yyyy-mm-dd" /> <span
													class="input-group-addon"> <i
													class="fa fa-calendar bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 活动介绍 </label>
								<div class="col-sm-9">
									<textarea class="col-xs-10 col-sm-6 limited" id="form-field-9"
										name="updateActivity.info" placeholder="最长50字" maxlength="50"></textarea>
								</div>
							</div>
							<input type="hidden" name="activityID" id="actIdInput" />
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" id="inputEdit" class="btn btn-success"
							data-dismiss="modal">提交</button>
					</div>

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
	<script src="assets/js/spinbox.min.js"></script>
	<script src="assets/js/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/jquery.inputlimiter.min.js"></script>

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>
	<script src="assets/js/jquery.share.min.js"></script>


	<script type="text/javascript">
	    function centerModals(){
		    $('.modal').each(function(i){   //遍历每一个模态框
		        var $clone = $(this).clone().css('display', 'block').appendTo('body');    
		        var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
		        top = top > 0 ? top : 0;
		        $clone.remove();
		        $(this).find('.modal-content').css("margin-top", top-30);  //修正原先已经有的30个像素
		    });
		}
		$('.modal').on('show.bs.modal', centerModals);      //当模态框出现的时候
		$(window).on('resize', centerModals);               //当窗口大小变化的时候
	
		jQuery(function($) {
					
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
			var th_checked = this.checked;//checkbox inside "TH" table header
						
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
				
			$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
				var $row = $(this).closest('tr');
				if($row.is('.detail-row ')) return;
				if(this.checked) $row.addClass(active_class);
				else $row.removeClass(active_class);
			});
					
			$('.show-details-btn').on('click', function(e) {
				e.preventDefault();
				$(this).closest('tr').next().toggleClass('open');
				$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
			});
			
			$('textarea.limited').inputlimiter({
				remText: '%n character%s remaining...',
				limitText: 'max allowed : %n.'
			});
  			
  			$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, touch_spinner: true, icon_up:'ace-icon fa fa-caret-up bigger-110', icon_down:'ace-icon fa fa-caret-down bigger-110'});
  			
  			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function(){
				$(this).prev().focus();
			});

		});
		
		
		$(document).ready(function(){  
		    $("a.btn-info").click(function(){  
		        $('#actIdInput').val($(this).attr("actId"));
		    });
		    $("a.tooltip-info").click(function(){  
		        $('#actIdInput').val($(this).attr("actId"));
		    });
		    $("button#inputEdit").click(function(){  
		        var params = $("form.form-horizontal").serialize();
		        $.get("updateActivity",params,function(data){
		            $("tr."+data.activityID).find("span.wholeAmount").text(data.updateActivity.wholeAmount);
		            $("tr."+data.activityID).find("span.size").text(data.updateActivity.size);
		            $("tr."+data.activityID).find("span.info").text(data.updateActivity.info);
		            $("tr."+data.activityID).find("td.createDate").text(data.updateActivity.createDate.slice(0,10));
		            $("tr."+data.activityID).find("td.endDate").text(data.updateActivity.endDate.slice(0,10));
		         });
		    });
		    var numOfSettle = 0;
		    $("a.btn-success").click(function(){
		    	var activityId=$(this).attr("actId")
		    	var params="activityID="+activityId;
		    	if(numOfSettle==0){
		    		numOfSettle=1;
			    	var url="settle";
			    	$(this).removeClass("btn-success");
			    	$(this).addClass("btn-primary");
			        $.get(url,params,function(data){
			        	alert("开始结算"+data.activityID);
			        	$("td."+activityId).text("活动结算中");
			        });
		    	}
		    	else if(numOfSettle==1){
		    		numOfSettle=2;
			    	var url="settle";
			    	$(this).removeClass("btn-primary");
			    	$(this).addClass("btn-default disabled");
			        $.get(url,params,function(data){
			        	alert("结算完成");
			        	$("td."+activityId).text("结算完成");
			        });
		    	}
		    });
		    $("a.tooltip-info").click(function(){
		    	var url="settle";
		    	var activityId=$(this).attr("actId")
		    	var params="activityID="+activityId;
		    	$(this).removeClass("tooltip-info");
		    	$(this).addClass("tooltip-primary");
		        $.get(url,params,function(data){
		        	alert("开始结算");
		        	$("td."+activityId).text("活动结算中");
		        });
		    });
		    $("a.btn-primary").click(function(){
		    	var url="settle";
		    	var activityId=$(this).attr("actId")
		    	var params="activityID="+activityId;
		    	$(this).removeClass("btn-primary");
		    	$(this).addClass("btn-default disabled");
		        $.get(url,params,function(data){
		        	alert("结算完成");
		        	$("td."+activityId).text("结算完成");
		        });
		    });
		    $("a.tooltip-primary").click(function(){
		    	var url="settle";
		    	var activityId=$(this).attr("actId")
		    	var params="activityID="+activityId;
		    	$(this).removeClass("tooltip-primary");
		    	$(this).addClass("tooltip-default disabled");
		        $.get(url,params,function(data){
		        	alert("结算完成");
		        	$("td."+activityId).text("结算完成");
		        });
		    });
		});
</script>
</body>
</html>
