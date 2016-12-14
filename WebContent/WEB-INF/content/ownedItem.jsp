<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" sizes="180x180" href="assets/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" href="assets/images/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="assets/images/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="assets/images/manifest.json">
	<link rel="mask-icon" href="assets/images/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="theme-color" content="#ffffff">
	<title>创建的活动的具体项目</title>
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
	
	<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css">
	<link rel="stylesheet" href="assets/css/ace.min.css"
		class="ace-main-stylesheet" id="main-ace-style">
	<link rel="stylesheet" href="assets/css/ace-skins.min.css">
	<link rel="stylesheet" href="assets/css/ace-rtl.min.css">
	
	<script src="assets/js/ace-extra.min.js"></script>
	
	<style type="text/css">
	  body {
	    font-family: 'Helvetica Neue', 'Helvetica', 'Microsoft Yahei', sans-serif;
	    -webkit-font-smoothing: antialiased;
	  }
	  .badge.badge-grey {
	  	background-color: #C5D0DC!important;
	  }
	  .ace-nav>li.wateryellow>a {
	    background-color: #A1AFC9!important;
	  }
	  .ace-nav>li.wateryellow>a:focus,
	  .ace-nav>li.wateryellow>a:hover {
	    background-color: #88ADA6!important;
	  }
	  
	  .ace-nav>li.bluepurple>a:focus,
	  .ace-nav>li.bluepurple>a:hover {
	  	background-color: #CCA4E3!important;
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
					<li class="wateryellow"><a href="index"> <i
							class="fa fa-home fa-fw fa-2x" aria-hidden="true"></i> <span
							class="badge badge-grey">首页</span>
					</a></li>

					<li class="bluepurple"><a href="" data-toggle="modal" data-target="#myModal"> <i
							class="fa fa-book fa-fw fa-2x" aria-hidden="true"></i> <span
							class="badge badge-grey">关于</span>
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
									aria-hidden="true"></i> 编辑
							</a></li>
							<li><a href="logout"> <i class="fa fa-sign-out fa-fw"
									aria-hidden="true"></i> 注销
							</a></li>
						</ul></li>
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
							网站介绍 </span>
				</a> <b class="arrow"></b></li>
				<li class=""><a href="showJoinedActivity"> <i
						class="menu-icon fa fa-list-alt"></i> <span class="menu-text">
							参加的活动 </span>
				</a> <b class="arrow"></b></li>
				<li class="active"><a href="showOwnedActivity"> <i
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
						<li><i class="ace-icon fa fa-folder-open home-icon"></i>
							创建的活动
						</li>
						<li class="active"><a href="">活动项目</a></li>
					</ul>
				</div>
				<div class="page-content">
					<div class="page-header"></div>
					<div class="row">
						<div class="col-xs-12">

							<div class="widget-box transparent" id="recent-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">
										<i class="ace-icon fa fa-rss orange"></i> 活动
									</h4>
									<div class="widget-toolbar no-border">
										<ul class="nav nav-tabs" id="recent-tab">
											<li class="active"><a data-toggle="tab" href="#task-tab">项目</a>
											</li>
											<li><a data-toggle="tab" href="#member-tab">成员</a>
											</li>
											<li><a data-toggle="tab" href="#comment-tab">反馈</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- widget-header-end -->

								<div class="widget-body">
									<div class="widget-main padding-4">
										<div class="tab-content padding-8">
											<div id="task-tab" class="tab-pane active">
												<h4 class="smaller lighter green">
													<i class="ace-icon fa fa-list"></i> 项目
												</h4>
												<form action="addItem">
												<table id="simple-table-1"
													class="table  table-bordered table-hover">
													<thead>
														<tr>
															<th>项目名称</th>
															<th>金额</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator value="updateActivity.Items" id="i">
															<tr>
																<td><s:property value="#i.detial" /></td>
																<td><s:property value="#i.amount" /></td>
																<td>
																	<div class="btn-group">
																		<s:if test="updateActivity.type==2">
																		<a href="#" type="button" class="btn btn-xs btn-info disabled"
																			title="编辑<s:property value="updateActivity.type"/>" data-toggle="modal"
																			data-target="#myModal2" actId=<s:property value="#i.id"/>> <i
																			class="ace-icon fa fa-pencil bigger-120"></i>
																		</a> 
																		</s:if>
																		<s:elseif test="updateActivity.type==1">
																		<a href="#" type="button" class="btn btn-xs btn-info disabled"
																			title="编辑<s:property value="updateActivity.type"/>" data-toggle="modal"
																			data-target="#myModal2" actId=<s:property value="#i.id"/>> <i
																			class="ace-icon fa fa-pencil bigger-120"></i>
																		</a> 
																		</s:elseif>
																		<s:else>
																		<a href="#" type="button" class="btn btn-xs btn-info"
																			title="编辑<s:property value="updateActivity.type"/>" data-toggle="modal"
																			data-target="#myModal" actId=<s:property value="#i.id"/>> <i
																			class="ace-icon fa fa-pencil bigger-120"></i>
																		</a> 
																		</s:else>
																	
																		<a href="#" type="button"
																			class="btn btn-xs btn-danger" title="删除"> <i
																			class="ace-icon fa fa-trash-o bigger-120"></i>
																		</a>
																	</div>
																</td>
															</tr>
														</s:iterator>
													</tbody>
												</table>
												<input type="hidden" name ="activityID" value ="<s:property value="updateActivity.id" />">
												<div class="btn-group">
													<button id="addSubmit" type="submit"
														class="btn btn-xs btn-success hidden" style="font-size: 14px; text-align: center; padding: .425rem; width: 2.5rem;" title="提交">
														<i class="fa fa-check"></i>
													</button>
													<s:if test="updateActivity.type==2">
													<button  id="addItem" type="button"
														class="btn btn-xs btn-primary disabled" style="font-size: 14px; text-align: center; padding: .425rem; width: 2.5rem;" title="添加一个新项目">
														<i class="fa fa-plus"></i>
													</button>
													</s:if>
													<s:elseif test="updateActivity.type==1">
													<button  id="addItem" type="button"
														class="btn btn-xs btn-primary disabled" style="font-size: 14px; text-align: center; padding: .425rem; width: 2.5rem;" title="添加一个新项目">
														<i class="fa fa-plus"></i>
													</button>
													</s:elseif>
													<s:else>
													<button  id="addItem" type="button"
														class="btn btn-xs btn-primary" style="font-size: 14px; text-align: center; padding: .425rem; width: 2.5rem;" title="添加一个新项目">
														<i class="fa fa-plus"></i>
													</button>
													</s:else>
												</div>
												</form>
											</div>

											<div id="member-tab" class="tab-pane">
												<h4 class="smaller lighter green">
													<i class="ace-icon fa fa-list"></i>成员
													
												</h4>

												<table id="simple-table"
													class="table  table-bordered table-hover">
													<thead>
														<tr>

															<th class="detail-col">项目</th>
															<th>昵称</th>
															<th>用户名</th>
															<th>个人应付AA总额</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator value="updateActivity.Members" id="u">
															<tr>
																<td class="center">
																	<div class="action-buttons">
																		<a href="#" class="green bigger-140 show-details-btn"
																			title="Show Details"> <i
																			class="ace-icon fa fa-angle-double-down"></i>
																		</a>
																	</div>
																</td>
																<td><s:property value="#u.user.nickname" /></td>
																<td><s:property value="#u.user.userName" /></td>
																<td>
																	<s:if test="updateActivity.type==0">
																		未结算
																	</s:if>
																	<s:elseif test="updateActivity.type==1">
																	<s:property value="#u.amount" />
																	</s:elseif>
																</td>
																<td>
																	<div class="btn-group">
																		<a href="#" type="button" class="btn btn-xs btn-info"
																			title="成员信息"> <i
																			class="ace-icon fa fa-info-circle bigger-120"></i>
																		</a> <a href="#" type="button"
																			class="btn btn-xs btn-danger" title="删除"> <i
																			class="ace-icon fa fa-trash-o bigger-120"></i>
																		</a>
																	</div>
																</td>
															</tr>

															
																<tr class="detail-row">
																	<td colspan="6">
																		<div class="table-detail">
																			<div class="row">
																				<div class="col-xs-12">
																					<div class="table-detail">
																						<div
																							class="profile-user-info profile-user-info-striped">
																							<s:iterator value="#u.joinItems" id="uJ">
																							<div class="profile-info-row">
																								<div class="profile-info-name">项目名称</div>
																								<div class="profile-info-value">
																									<span><s:property value="#uJ.detial"></s:property></span>
																								</div>
																								<div class="profile-info-name">项目金额</div>
																								<div class="profile-info-value">
																									<span><s:property value="#uJ.amount"></s:property></span>
																								</div>
																								
																							</div>
																							</s:iterator>
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

											<div id="comment-tab" class="tab-pane">
												<h4 class="smaller lighter green">
													<i class="ace-icon fa fa-list"></i> 反馈
												</h4>
												<table id="simple-table"
													class="table  table-bordered table-hover">
													<thead>
														<tr>
															<th>发送者</th>
															<th>差额</th>
															<th>备注</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator value="updateActivity.Members" id="u">
															<s:iterator value="#u.messages" id="um">
																<tr>
																	<td><s:property value="#u.user.nickname"></s:property></td>
																	<td><s:property value="#um.amount"></s:property></td>
																	<td><s:property value="#um.remark"></s:property></td>
																	<td>
																		<div class="btn-group">
																			<s:if test="#um.type==0">  
																			<s:if test="updateActivity.type==2">
																			<a href="#" type="button"
																				class="btn btn-xs btn-success messageOperation disabled <s:property value="#um.id" />" title="接受"
																				messageId="<s:property value="#um.id" />"> <i
																				class="ace-icon fa fa-check bigger-120"></i>
																			</a> <a href="#" type="button"
																				class="btn btn-xs btn-danger messageOperation disabled <s:property value="#um.id" />" title="拒绝"
																				messageId="<s:property value="#um.id" />"> <i
																				class="ace-icon fa fa-times bigger-120"></i>
																			</a>					
																			</s:if>								
																			<s:else>
																			<a href="#" type="button"
																				class="btn btn-xs btn-success messageOperation  <s:property value="#um.id" />" title="接受"
																				messageId="<s:property value="#um.id" />"> <i
																				class="ace-icon fa fa-check bigger-120"></i>
																			</a> <a href="#" type="button"
																				class="btn btn-xs btn-danger messageOperation <s:property value="#um.id" />" title="拒绝"
																				messageId="<s:property value="#um.id" />"> <i
																				class="ace-icon fa fa-times bigger-120"></i>
																			</a>
																			</s:else>	
																			</s:if> <s:elseif test="#um.type==1">  
																			已接受
																			</s:elseif> 
																			<s:elseif test="#um.type==2">  
																			已拒绝 
																			</s:elseif>

																		</div>
																	</td>
																</tr>
															</s:iterator>
														</s:iterator>
													</tbody>

												</table>

											</div>


										</div>
									</div>
								</div>
								<!-- widget-body end -->

							</div>
							<!-- widget-box end -->
						</div>
						<!-- col-xs-12 end -->

					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" style="position: fixed;" id="myModal2"
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
						<form class="form-horizontal" action="updateItem" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 项目名称 </label>
								<div class="col-sm-9">
									<input type="text" class="col-xs-10 col-sm-6" id="form-field-1"
										name="updateItem.detial" placeholder=<s:property value="#i.detial"/> value=<s:property value="#i.detial"/>>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 项目金额 </label>
								<div class="col-sm-9">
									<input type="text" class="col-xs-10 col-sm-4" id="form-field-1"
										name="updateItem.amount" placeholder=<s:property value="#i.amount"/> value=<s:property value="#i.amount"/>>
								</div>
							</div>
							<input id="itemIdInput" type="hidden" name="updateItem.id" value=<s:property value="#i.id"/>>
							
						</form>
					</div>
					<div class="modal-footer">
						<button id="itemEdit" type="submit" class="btn btn-success" data-dismiss="modal">提交</button>
					</div>
				</div>
			</div>
		</div>


		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>

	<div class="modal fade" style="position: fixed;" id="myModal"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content">
		    <div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">提示</h4>
			</div>
			<div class="modal-body">
			  	我们的网站暂时不支持IE，推荐使用chrome浏览器，
			  <br>如果您在使用过程中发现任何问题，欢迎联系我们：
			  <br>Github地址：<a href="https://github.com/anyua/lets-go-dutch">https://github.com/anyua/lets-go-dutch</a>
			  <br>联系邮箱：sqq0103@gmail.com
			</div>
		  </div>
		</div>	
    </div>
    
	<script src="assets/js/jquery-2.1.4.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/js/jquery-ui.custom.min.js"></script>

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>
	<script src="assets/js/modal.js"></script>

	<script type="text/javascript">
		function centerModals() {
			$('.modal').each(
					function(i) { //遍历每一个模态框
						var $clone = $(this).clone().css('display', 'block')
								.appendTo('body');
						var top = Math.round(($clone.height() - $clone.find(
								'.modal-content').height()) / 2);
						top = top > 0 ? top : 0;
						$clone.remove();
						$(this).find('.modal-content').css("margin-top",
								top - 30); //修正原先已经有的30个像素
					});
		}
		$('.modal').on('show.bs.modal', centerModals); //当模态框出现的时候
		$(window).on('resize', centerModals); //当窗口大小变化的时候

		jQuery(function($) {
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on(
					'click',
					function() {
						var th_checked = this.checked;//checkbox inside "TH" table header

						$(this).closest('table').find('tbody > tr').each(
								function() {
									var row = this;
									if (th_checked)
										$(row).addClass(active_class).find(
												'input[type=checkbox]').eq(0)
												.prop('checked', true);
									else
										$(row).removeClass(active_class).find(
												'input[type=checkbox]').eq(0)
												.prop('checked', false);
								});
					});


			$('#simple-table').on('click', 'td input[type=checkbox]',
					function() {
						var $row = $(this).closest('tr');
						if ($row.is('.detail-row '))
							return;
						if (this.checked)
							$row.addClass(active_class);
						else
							$row.removeClass(active_class);
					});

			$('.show-details-btn').on(
					'click',
					function(e) {
						e.preventDefault();
						$(this).closest('tr').next().toggleClass('open');
						$(this).find(ace.vars['.icon']).toggleClass(
								'fa-angle-double-down').toggleClass(
								'fa-angle-double-up');
					});

		});
		$(document).ready(function(){
			$("a.messageOperation").click(function(){
				var messageId=$(this).attr("messageId");
				var params="messageId="+messageId;
				if($(this).attr("title")=="接受"){
					var url="acceptFeedback"
				}
				else if($(this).attr("title")=="拒绝"){
					var url="refuseFeedback"
				}
		    	$("a."+messageId).addClass("disabled");
		        $.get(url,params,function(data){
		        	alert("提交成功");
		        });
			});
		    $("a.btn-info").click(function(){  
		        $('#itemIdInput').val($(this).attr("actId"));
		    });
		    $("a.tooltip-info").click(function(){  
		        $('#itemIdInput').val($(this).attr("actId"));
		    });
			$("button#itemEdit").click(function(){
				var params = $("form.form-horizontal").serialize();
				$.get("updateItem",params,function(data){
				    $("tr."+data.itemID).find("span.detial").text(data.updateItem.detial);
				    $("tr."+data.itemID).find("span.amount").text(data.updateItem.amount);
				 });
			})
			$("button#addItem").click(function(){
				
				var submitBtn = document.getElementById('addSubmit');
				submitBtn.classList.remove('hidden');

				var tb = document.querySelector('#simple-table-1 > tbody');
				var tr = document.createElement('tr');

				var tdInfo = document.createElement('td');
				var inputInfo = document.createElement('input');
				inputInfo.setAttribute('type', 'text');
				inputInfo.setAttribute('name', 'detials');
				inputInfo.setAttribute('placeholder', '项目信息');
				inputInfo.setAttribute('required', 'required');
				inputInfo.classList.add('col-xs-12');
				tdInfo.appendChild(inputInfo);

				var tdAmount = document.createElement('td');
				var inputAmount = document.createElement('input');
				inputAmount.setAttribute('type', 'text');
				inputAmount.setAttribute('name', 'amounts');
				inputAmount.setAttribute('placeholder', '项目金额');
				inputAmount.setAttribute('required', 'required');
				inputAmount.classList.add('col-xs-12');
				tdAmount.appendChild(inputAmount);

				var tdOp = document.createElement('td');
				var delBtn = document.createElement('button');
				delBtn.setAttribute('type', 'button');
				delBtn.setAttribute('title', '删除');
				delBtn.classList.add('btn');
				delBtn.classList.add('btn-xs');
				delBtn.classList.add('btn-danger');
				delBtn.innerHTML = '<i class="ace-icon fa fa-trash-o bigger-120"></i>';
				delBtn.addEventListener('click', function(){
					tb.removeChild(tr);
				});
				tdOp.appendChild(delBtn);

				tr.appendChild(tdInfo);
				tr.appendChild(tdAmount);
				tr.appendChild(tdOp);
				tb.appendChild(tr);
			
			});
		});
	</script>
</body>
</html>
