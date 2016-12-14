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
	<title>参与的活动</title>

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
						<li><i class="ace-icon fa fa-folder-open home-icon"></i>
							参加的活动
						</li>
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
										<th class="detail-col">更多</th>
										<th>活动名称</th>
										<th>开始日期</th>
										<th>结束日期</th>
										<th></th>
									</tr>
								</thead>

								<tbody>

									<s:iterator value="joinedActivity" id="a">
										<tr>
											<td class="center">
												<div class="action-buttons">
													<a href="#" class="green bigger-140 show-details-btn"
														title="Show Details"> <i
														class="ace-icon fa fa-angle-double-down"></i> <span
														class="sr-only">更多</span>
													</a>
												</div>
											</td>
											<td><a href="showActivity?activityID=<s:property value="#a.id"/>">
											<s:property value="#a.name" /></a>
											<s:if test="#a.owner.id==pageOwner.id">
											<span class="label label-info">*我创建的</span>
											</s:if>
											</td>
											<td><s:property value="#a.createDate" /></td>
											<td><s:property value="#a.endDate" /></td>

											<td>
												<div class="hidden-sm hidden-xs btn-group">
													<button class="btn btn-xs btn-danger">
														<i class="ace-icon fa fa-trash-o bigger-120"></i>
													</button>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary">
															<i class="ace-icon fa fa-trash-o icon-only bigger-110"></i>
														</button>
													</div>
												</div>
											</td>

										</tr>


										<tr class="detail-row">
											<td colspan="6">
												<div class="table-detail">
													<div class="row">
														<div class="col-xs-12 col-sm-2">
	                          							<s:if test="#a.type==2">
															<a href="#"><img height="50" width="140"
																class="thumbnail" alt="现金支付"
																src="assets/images/cash.png" /></a> <a href="#"><img
																height="50" width="140" class="thumbnail" alt="支付宝"
																src="assets/images/wepay.png" /></a> <a href="#"><img
																height="50" width="140" class="thumbnail" alt="微信"
																src="assets/images/alipay.jpg" /></a>
															</s:if>	
														</div>
														<div class="col-xs-12 col-sm-7">

															<div class="profile-user-info profile-user-info-striped">
																<div class="profile-info-row">
																	<div class="profile-info-name">实际总额</div>
																	<div class="profile-info-value">
																		<span><s:property value="#a.wholeAmount" /></span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">参与人数</div>
																	<div class="profile-info-value">
																		<span><s:property value="#a.size" /></span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">活动状态</div>
																	<div class="profile-info-value">
																		<span> <s:if test="#a.type==0">  
																			活动进行中
																			</s:if> <s:elseif test="#a.type==1">  
																			活动结算中
																			</s:elseif> <s:else>  
																			活动结束  
																			</s:else>
																		</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">个人应付</div>
																	<div class="profile-info-value">
																		<span>
																		<s:iterator value="#a.Members" id="m">
																			<s:if test="#m.user.id==pageOwner.id">
																				<s:property value="#m.amount" />
																			</s:if>
																		</s:iterator>
																		</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">活动介绍</div>
																	<div class="profile-info-value">
																		<span><s:property value="#a.info" /></span>
																	</div>
																</div>

															</div>
														</div>
														<div class="col-xs-12 col-sm-3">
														<s:if test="#a.type==0">
															<div class="space visible-xs"></div>
															<h4 class="header blue lighter less-margin">意见反馈</h4>
															<form class="<s:property value="#a.id"/>">
																<fieldset>
																	<textarea class="width-100 limited" resize="none"
																		name="message.remark"
																		placeholder="有什么疑问写出来吧" maxlength="20"></textarea>
																</fieldset>
																<div class="hr hr-dotted"></div>
																<div class="clearfix">
																	<input type="text" class="pull-left col-xs-6 col-sm-6"
																		id="form-field-1" name="message.amount"
																		placeholder="差额">
																	<button activityid="<s:property value="#a.id"/>"
																		class="pull-right btn btn-sm btn-primary btn-white btn-round feedBackButton"
																		type="button">
																		发送 <i
																			class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
																	</button>
																</div>
																<input type="hidden" name="activityId"
																	value=<s:property value="#a.id"/>>
															</form>
														</s:if>
														<s:if test="#a.type==1">
															<div class="space visible-xs"></div>
															<h4 class="header blue lighter less-margin">意见反馈</h4>
															<form class="<s:property value="#a.id"/>">
																<fieldset>
																	<textarea class="width-100 limited" resize="none"
																		name="message.remark"
																		placeholder="有什么疑问写出来吧" maxlength="20"></textarea>
																</fieldset>
																<div class="hr hr-dotted"></div>
																<div class="clearfix">
																	<input type="text" class="pull-left col-xs-6 col-sm-6"
																		id="form-field-1" name="message.amount"
																		placeholder="差额">
																	<button activityid="<s:property value="#a.id"/>"
																		class="pull-right btn btn-sm btn-primary btn-white btn-round feedBackButton"
																		type="button">
																		发送 <i
																			class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
																	</button>
																</div>
																<input type="hidden" name="activityId"
																	value=<s:property value="#a.id"/>>
															</form>
														</s:if>
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
	<script src="assets/js/jquery.inputlimiter.min.js"></script>

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>
	
	<script src="assets/js/modal.js"></script>	

	<script type="text/javascript">
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

			//select/deselect a row when the checkbox is checked/unchecked
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

			$('textarea.limited').inputlimiter({
				remText : '%n character%s remaining...',
				limitText : 'max allowed : %n.'
			});

		});
	</script>

</body>
</html>
