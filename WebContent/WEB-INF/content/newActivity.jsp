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
          <li class="wateryellow">
            <a href="index">
              <i class="fa fa-home fa-fw fa-2x" aria-hidden="true"></i>
              <span class="badge badge-grey">首页</span>
            </a>
          </li>
          
          <li class="bluepurple">
            <a href="" data-toggle="modal" data-target="#myModal">
              <i class="fa fa-book fa-fw fa-2x" aria-hidden="true"></i>
              <span class="badge badge-grey">关于</span>
            </a>
          </li>
          <li class="light-blue dropdown-modal">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
              <img class="nav-user-photo" src="assets/images/user.jpg">
              <span class="user-info">
			    <small>你好,</small>
			    <s:property value="pageOwner.nickname" />
			  </span>
              <i class="ace-icon fa fa-caret-down"></i>
             </a>
             <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
			   <li>
			     <a href="profile">
			       <i class="fa fa-cog fa-fw" aria-hidden="true"></i>
					 		 编辑
			     </a>
		       </li>
		       <li>
			     <a href="logout">
			       <i class="fa fa-sign-out fa-fw" aria-hidden="true"></i>
						 注销
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
        <li class="">
          <a href="welcome?">
			<i class="menu-icon fa fa-tachometer"></i>
			  <span class="menu-text"> 网站介绍 </span>
		  </a>
		  <b class="arrow"></b>
        </li>
        <li class="">
		  <a href="showJoinedActivity">
			<i class="menu-icon fa fa-list-alt"></i>
			<span class="menu-text"> 参加的活动 </span>
		  </a>
		  <b class="arrow"></b>
		</li>
		<li class="">
		  <a href="showOwnedActivity">
		    <i class="menu-icon fa fa-calendar"></i>
		    <span class="menu-text"> 创建的活动 </span>
		   </a>
		   <b class="arrow"></b>
		</li>
		<li class="active">
		  <a href="newActivity">
		    <i class="menu-icon fa fa fa-pencil"></i>
			<span class="menu-text"> 新建活动 </span>
		  </a>
		  <b class="arrow"></b>
		</li>
		<li class="">
		  <a href="addActivity">
		    <i class="menu-icon fa fa-plus-circle"></i>
			<span class="menu-text"> 加入活动 </span>
		  </a>
		  <b class="arrow"></b>
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
			  <i class="ace-icon fa fa-folder-open home-icon"></i>
			 	 新建活动
			</li>
		  </ul>
		</div>
        <div class="page-content">
          <div class="page-header">
          </div>
          <s:if test="error==1">
          <div class="col-md-2 column" ></div>
          <div class="col-md-6 column" >
	          <div class="alert alert-dismissible alert-danger">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>创建新活动失败</strong> 请重新创建~
			  </div>
		  </div>
          </s:if>
          <s:elseif test="error==2">
          <div class="col-md-3 column" ></div>
          <div class="col-md-6 column" >
              <div class="alert alert-dismissible alert-danger">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>该活动名已存在</strong> 请重新创建~
			  </div>
		  </div>
          </s:elseif>
          <div class="row">
            <div class="col-xs-12">
              <form class="form-horizontal" action="createActivity" role="form">
 				<div class="form-group">
				  <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 活动名称 </label>
				  <div class="col-sm-9">
				    <input type="text" class="col-xs-10 col-sm-4" id="form-field-1"  
				    	name="newActivity.name" placeholder="最长不超过15个字符" size="15" required />
				  </div>
			    </div>
			   
			    <div class="form-group">
				  <label class="col-sm-3 control-label no-padding-right" for="spinner2"> 参与人数  </label>
				  <div class="col-sm-9">
				    <input type="text" class="input-sm" id="spinner2" name="newActivity.size" required />
				  </div>
			    </div>
			    
			     <div class="form-group">
			       <label class="col-sm-3 control-label no-padding-right" for="id-date-picker-1"> 起始日期 </label>
			       <div class="col-sm-9">
			         <div class="row">
						<div class="col-xs-10 col-sm-4">
						  <div class="input-group">
							<input type="text" class="form-control date-picker" id="id-date-picker-1" 
								name="newActivity.createDate" data-date-format="yyyy-mm-dd" required />
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
						<div class="col-xs-10 col-sm-4">
						  <div class="input-group">
							<input type="text" class="form-control date-picker" id="id-date-picker-1" 
								name="newActivity.endDate" data-date-format="yyyy-mm-dd" required />
							<span class="input-group-addon">
							  <i class="fa fa-calendar bigger-110"></i>
							</span>
						  </div>
						</div>
					  </div>																
			        </div>
			      </div>
			    
			      <div class="form-group">
				    <label class="col-sm-3 control-label no-padding-right" for="form-field-9"> 活动介绍 </label>
				    <div class="col-sm-9">
					  <textarea class="col-xs-10 col-sm-6 limited" id="form-field-9" 
					  	name="newActivity.info" placeholder="最长50字" maxlength="50"></textarea>
				    </div>
			      </div>
			      
			      <div class="form-group">
				    <label class="col-sm-3 control-label no-padding-right" for="addItem">添加项目</label>
				    <div class="col-sm-9">
					  <input type="button" class="btn btn-sm btn-info" id="addItem" value="+"
					  	style="padding: 9; font-size: 14px; font-weight: bolder;">
				    </div>
			      </div>
			      <div id="addForm"></div>
			      <div class="hr hr-18 dotted"></div>
			     
			      
			      <div class="form-group">
			        <label class="col-sm-3 control-label no-padding-right"></label>
			        <div class="col-sm-9">
			          <button type="reset" class="btn btn-sm btn-success">
					    <i class="ace-icon fa fa-arrow-left icon-on-right bigger-110"></i>
						    清空
				      </button>
				  
				      <button type="submit" class="btn btn-sm btn-success">
						  创建
					    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
				      </button>
				    </div>
				  </div>
				 
			             
              </form>
            </div>
          </div>
		</div>
      </div>
    </div>
    
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	  <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
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
  <script src="assets/js/spinbox.min.js"></script>
  <script src="assets/js/bootstrap-datepicker.min.js"></script>
  <script src="assets/js/jquery.inputlimiter.min.js"></script>
  
  <script src="assets/js/ace-elements.min.js"></script>
  <script src="assets/js/ace.min.js"></script>
  
  <script src="assets/js/modal.js"></script>	
  
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
  		
  		$(document).ready(function(){

  			$("#addItem").click(function(){
  				var addForm = document.getElementById('addForm');
  				var divForm = document.createElement('div');
  				divForm.classList.add('form-group');
  				
  				var iconLabel = document.createElement('label');
  				iconLabel.classList.add('col-sm-3', 'control-label', 'no-padding-right');
  				iconLabel.style.paddingTop = '5px';
  				var iconBtn = document.createElement('button');
  				iconBtn.classList.add('btn-link');
  				iconBtn.innerHTML = '<i class="fa fa-trash-o"></i>';
  				iconBtn.addEventListener('click', function(){
  					addForm.removeChild(divForm);
  				});
  				iconLabel.appendChild(iconBtn);
  				
  				var inputForm = document.createElement('div');
  				inputForm.classList.add('col-sm-9');
  				
  				var inputText1 = document.createElement('input');
  				inputText1.setAttribute('type', 'text');
  				inputText1.setAttribute('name', 'detials');
  				inputText1.setAttribute('id', 'itemdetials');
  				inputText1.setAttribute('placeholder', '项目名称');
  				inputText1.setAttribute('required', 'required');
  				inputText1.classList.add('col-xs-10', 'col-sm-3');
  				inputForm.appendChild(inputText1);
  				
  				var inputText2 = document.createElement('input');
  				inputText2.setAttribute('type', 'text');
  				inputText2.setAttribute('name', 'amounts');
  				inputText2.setAttribute('placeholder', '项目金额');
  				inputText2.setAttribute('required', 'required');
  				inputText2.setAttribute('pattern', '^([1-9][0-9]*)\.?([0-9]{1,2})$');
  				inputText2.classList.add('col-xs-10', 'col-sm-3');
  				inputForm.appendChild(inputText2);
  				
  				divForm.appendChild(iconLabel);
  				divForm.appendChild(inputForm);
  				addForm.appendChild(divForm);
  			});
  			
  			
  			
  		});
  </script>
  
</body>
</html>
