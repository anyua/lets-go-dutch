<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>创建活动</title>
  
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <!-- <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css">  -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  
  <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
  <link rel="stylesheet" href="assets/css/chosen.min.css" />
  <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
		
  <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css">
  <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style">
  <link rel="stylesheet" href="assets/css/ace-skins.min.css">
  <link rel="stylesheet" href="assets/css/ace-rtl.min.css">
  
  <script src="assets/js/ace-extra.min.js"></script>
  
  <script type="text/javascript">
	$(document).ready(function(){
		var i=0;
		$("#addItem").click(function(){
			i=i+1;
    		$("#addform").append("<tr><td>"+i+"</td><td><input id=\"itemdetials\" name=\"detials\" type=\"text\" value=\"项目信息\"></td><td><input name=\"amounts\" type=\"text\" value=\"项目金额\"></td></tr>");
		});
	});
</script>
  
</head>
<body class="skin-1">
  <div id="navbar" class="navbar navbar-default          ace-save-state">
	<div class="navbar-container ace-save-state" id="navbar-container">
	  <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
		<span class="sr-only">Toggle sidebar</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	  </button>

	  <div class="navbar-header pull-left">
	    <a href="#" class="navbar-brand">
		  <small>
		    <i class="fa fa-cutlery fa-lg" aria-hidden="true"></i>
		    LETS GO DUTCH
		  </small>
	    </a>
	  </div>

	  <div class="navbar-buttons navbar-header pull-right" role="navigation">
        <ul class="nav ace-nav">
          <li class="grey">
            <a href="index">
              <i class="fa fa-home fa-fw fa-2x" aria-hidden="true"></i>
              <span class="badge badge-grey">Home</span>
            </a>
          </li>
          
          <li class="purple">
            <a href="index">
              <i class="fa fa-book fa-fw fa-2x" aria-hidden="true"></i>
              <span class="badge badge-grey">About</span>
            </a>
          </li>
          <li class="light-blue dropdown-modal">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
              <img class="nav-user-photo" src="assets/images/user.jpg">
              <span class="user-info">
			    <small>Welcome,</small>
			    <s:property value="pageOwner.nickname" />
			  </span>
              <i class="ace-icon fa fa-caret-down"></i>
             </a>
             <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
			   <li>
			     <a href="profile">
			       <i class="fa fa-cog fa-fw" aria-hidden="true"></i>
					 		 Profile
			     </a>
		       </li>
		       <li>
			     <a href="#">
			       <i class="fa fa-sign-out fa-fw" aria-hidden="true"></i>
						 Logout
			     </a>
		       </li>
	         </ul>
	       </li>
         </ul>
       </div>
	</div>
  </div>
  
  <div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
		try{ace.settings.loadState('main-container')}catch(e){}
	</script>
	<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
	  <script type="text/javascript">
		try{ace.settings.loadState('sidebar')}catch(e){}
      </script>
      <ul class="nav nav-list">
        <li class="active">
          <a href="#">
			<i class="menu-icon fa fa-tachometer"></i>
			  <span class="menu-text"> Dashboard </span>
		  </a>
		  <b class="arrow"></b>
        </li>
        <li class="">
		  <a href="joinedActivity">
			<i class="menu-icon fa fa-list-alt"></i>
			<span class="menu-text"> 参加的活动 </span>
		  </a>
		  <b class="arrow"></b>
		</li>
		<li class="">
		  <a href="ownedActivity">
		    <i class="menu-icon fa fa-calendar"></i>
		    <span class="menu-text"> 创建的活动 </span>
		   </a>
		   <b class="arrow"></b>
		</li>
		<li class="">
		  <a href="newActivity">
		    <i class="menu-icon fa fa fa-pencil"></i>
			<span class="menu-text"> 新建活动 </span>
		  </a>
		</li>
      </ul>

	  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	  </div>
	</div>
    
    <div class="main-content">
      <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
		  <ul class="breadcrumb">
			<li>
			  <i class="ace-icon fa fa-home home-icon"></i>
			  <a href="#">首页</a>
			</li>
			<li class="active">新建活动</li>
		  </ul><!-- /.breadcrumb -->
		</div>
        <div class="page-content">
          <div class="page-header">
          </div>
          <div class="row">
            <div class="col-xs-12">
              <form class="form-horizontal" action="createActivity" role="form">
 				<div class="form-group">
				  <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 活动名称 </label>
				  <div class="col-sm-9">
				    <input type="text" class="col-xs-10 col-sm-4" id="form-field-1"  name="newActivity.name" placeholder="最长不超过15个字符" size="15" />
				  </div>
			    </div>
			    
			    <div class="form-group">
				  <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 参与人数  </label>
				  <div class="col-sm-9">
				    <input type="text" class="input-sm" id="spinner2" name="newActivity.size" />
				  </div>
			    </div>
			    
			    <div class="form-group">
				  <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 活动预算  </label>
				  <div class="col-sm-9">
				    <input type="text" class="col-xs-10 col-sm-2" id="form-field-1"  name="newActivity.wholeAmount" />
				  </div>
			    </div>
			    
			     <div class="form-group">
			       <label class="col-sm-3 control-label no-padding-right" for="id-date-picker-1"> 起始日期 </label>
			       <div class="col-sm-9">
			         <div class="row">
						<div class="col-xs-8 col-sm-11">
						  <div class="input-group">
							<input type="text" class="form-control date-picker" id="id-date-picker-1" name="newActivity.createDate" data-date-format="dd-mm-yyyy" />
							<span class="input-group-addon">
							  <i class="fa fa-calendar bigger-110"></i>
							</span>
						  </div>
						</div>
					  </div>													
			       </div>
			     </div>
			     
			      
			      <div class="form-group">
			        <label class="col-sm-3 control-label no-padding-right" for="id-date-picker-1"> 终止日期 </label>									
			        <div class="col-sm-9">
			          <div class="row">
						<div class="col-xs-8 col-sm-11">
						  <div class="input-group">
							<input type="text" class="form-control date-picker" id="id-date-picker-1" name="newActivity.endDate" data-date-format="dd-mm-yyyy" />
							<span class="input-group-addon">
							  <i class="fa fa-calendar bigger-110"></i>
							</span>
						  </div>
						</div>
					  </div>																
			        </div>
			      </div>
			    
			      <div class="form-group">
				    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 活动介绍 </label>
				    <div class="col-sm-9">
					  <textarea class="form-control limited" id="form-field-9" name="newActivity.info" placeholder="最长50字" maxlength="50"></textarea>
				    </div>
			      </div>
			      
			      <div class="form-group">
				    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 活动介绍 </label>
				    <div class="col-sm-9">
					  <input type="button" id="addItem" value="添加项目" />
					  <div id="addform"></div>
				    </div>
			      </div>
			     
	
			            
              </form>
            </div>
          </div>
		</div>
      </div>
    </div>
    
    
  </div>
  
 


  
  <script src="assets/js/jquery-2.1.4.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  
  <script src="assets/js/jquery-ui.custom.min.js"></script>
  <script src="assets/js/spinbox.min.js"></script>
  <script src="assets/js/bootstrap-datepicker.min.js"></script>
  <script src="assets/js/jquery.inputlimiter.min.js"></script>
  
  <script src="assets/js/ace-elements.min.js"></script>
  <script src="assets/js/ace.min.js"></script>
  
  <script type="text/javascript">
  		jQuery(function($) {
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
  </script>
  
</body>
</html>
