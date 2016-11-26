<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>登陆</title>
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" sizes="180x180" href="assets/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" href="assets/images/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="assets/images/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="assets/images/manifest.json">
	<link rel="mask-icon" href="assets/images/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="theme-color" content="#ffffff">
  
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Catamaran">
  
  <link rel="stylesheet" type="text/css" href="assets/css/login.css">
  
</head>
<body>
  
  <div class="wrapper">
    <div class="overlay"></div>
    <div class="content-container">
      <div class="logsign-header">
        <!-- 考虑用网站的icon什么的，暂时留白 -->
      </div>
      <div class="logsign-content">
        <form id="login-form" method="post" action="login">
          <fieldset>
            <legend>
              	登陆 <!-- 可换成其他的文字，暂时用这个 -->
            </legend>
            <ol>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                  <input type="text" id="user" class="form-control" name="login_user.userName" tabindex="1" placeholder="用户名" autofocus required>
                </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                  <input type="password" id="pass" class="form-control" name="login_user.password" tabindex="2" placeholder="密码" required>
                  <span id="msg"></span>
                </div>
              </li>
            </ol>
          </fieldset>
          <button class="btn btn-md my-btn-log my-btn-full" type="submit">登陆</button>
          <input type="hidden" name="activityID" value="${activityID}">
		  <input type="hidden" name="loginType" value="${loginType}">
        </form>
        
       
        <div class="login-choice-info">
          <p>
          	没有账号?<a href="signuppage">现在来注册吧</a>
          </p>
          <!-- 此处考虑添加登陆选项，如QQ图标和微信图标 -->
        </div>
      </div>
    </div>
  </div>
  
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
  
</body>
</html>