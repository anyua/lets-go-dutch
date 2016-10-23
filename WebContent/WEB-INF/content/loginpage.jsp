<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Login</title>
  
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Catamaran">
  <link rel="stylesheet" type="text/css" href="css/login.css">
  
</head>
<body>
  
  <div class="login-wrapper">
    <div class="overlay"></div>
    <div class="login-container">
      <div class="login-header">
        <!-- 考虑用网站的icon什么的，暂时留白 -->
      </div>
      <div class="login-content">
        <form id="login-form" class="login-table" method="get" action="login">
          <fieldset>
            <legend>
              LOG IN  <!-- 可换成其他的文字，暂时用这个 -->
            </legend>
            <ol>
              <li id="user">
                <div class="input-wrapper">
                  <span class="input-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                  <input type="text" name="login_user.userName" tabindex="1" placeholder="Username" autofocus="autofocus">
                </div>
              </li>
              <li id="pass">
                <div class="input-wrapper">
                  <span class="input-icon"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                  <input type="password" name="login_user.password" tabindex="2" placeholder="Password">
                </div>
              </li>
            </ol>
          </fieldset>
          <button class="btn btn-md my-btn my-btn-full" type="submit">LOG IN</button>
        </form>
        
       
        <div class="login-choice-info">
          <strong>通过其他途径登陆</strong>
          <!-- 此处考虑添加登陆选项，如QQ图标和微信图标 -->
        </div>
      </div>
    </div>
  </div>
 

</body>
</html>