<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>用户界面</title>
  
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <!-- <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css">  -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css">
  <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style">
  <link rel="stylesheet" href="assets/css/ace-skins.min.css">
  <link rel="stylesheet" href="assets/css/ace-rtl.min.css">
  
  <script src="assets/js/ace-extra.min.js"></script>
  
</head>
<body class="no-skin">
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
        <div class="page-content">
          <div class="row">
            <div class="col-xs-12">
              <table id="simple-table" class="table  table-bordered table-hover">
                <thead>
                  <tr>
                    <th class="center">
                      <label class="pos-rel">
						<input type="checkbox" class="ace" />
						<span class="lbl"></span>
					  </label>
                    </th>
                    <th class="detail-col">Details</th>
					<th>活动名称</th>
					<th>开始日期</th>
					<th>结束日期</th>
					<th></th>
                  </tr>
                </thead>
                
                <tbody>
                  <s:iterator value="joinedActivity" id='j'>
                  <tr>
                    <td class="center">
						<label class="pos-rel">
						  <input type="checkbox" class="ace" />
						  <span class="lbl"></span>
						</label>
					</td>
					
					<td class="center">
					  <div class="action-buttons">
					    <a href="#" class="green bigger-140 show-details-btn" title="Show Details">
						  <i class="ace-icon fa fa-angle-double-down"></i>
						  <span class="sr-only">Details</span>
						</a>
					  </div>
					</td>
					
					<td>
					  <a href="showActivity?activityID=<s:property value="#j.id" />"><s:property value="#j.name" /></a>
					</td>
					<td><s:property value="#j.createDate" /></td>
					<td><s:property value="#j.endDate" /></td>
					
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
                  </s:iterator>  
                  
                  <tr class="detail-row">
                    <td colspan="8">
                      <div class="table-detail">
                        <div class="col-xs-12 col-sm-9">
                          <div class="space visible-xs"></div>
                          <div class="profile-user-info profile-user-info-striped">
                          
 							<div class="profile-info-row">
							  <div class="profile-info-name"> 实际金额  </div>
							  <div class="profile-info-value">
								  <span><s:property value="updateActivity.wholeAmount"/></span>
							  </div>
							</div>
							
							<div class="profile-info-row">
							  <div class="profile-info-name"> 参与人数  </div>
							  <div class="profile-info-value">
								  <span><s:property value="updateActivity.size"/></span>
							  </div>
							</div> 
							
							<div class="profile-info-row">
							  <div class="profile-info-name"> 活动介绍 </div>
							  <div class="profile-info-value">
								  <span><s:property value="updateActivity.info"/></span>
							  </div>
							</div>
							                          
                          </div>
                        </div> 
                      </div>
                    </td>
                  </tr>
                  
                </tbody>
              
              </table>
            </div>
          </div>
		</div>
      </div>
    </div>
    
    
  </div>
  
 


  
  <script src="assets/js/jquery-2.1.4.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/ace-elements.min.js"></script>
  <script src="assets/js/ace.min.js"></script>
</body>
</html>
