<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Log in</title>
  
  
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Catamaran">
  <link rel="stylesheet" type="text/css" href="assets/css/login.css">
  
  <script type="text/javascript">
    function doLogin(type) {
    	var name = $('#user').attr('value');
    	var pw = $('pass').attr('value');
    	var url = 'login?login_user.userName=' + name + '&login_user.password=' + pw;
    	
    	if (name != null && name != "" && pw != null && pw != "") {
    		$.ajax({
        		url: url,
    			type: "post",
    			dataType: "json",
    			async: false,
    			success: function(data) {
    				if (data.login_userID == null) {
    					$("#msg").html("用户名或密码错误!");	
    				}
    			}	
        	})
    	}	
    }
  
  </script>
  
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
              LOG IN  <!-- 可换成其他的文字，暂时用这个 -->
            </legend>
            <ol>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                  <input type="text" id="user" class="form-control" name="login_user.userName" tabindex="1" placeholder="Account" autofocus required>
                </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                  <input type="password" id="pass" class="form-control" name="login_user.password" tabindex="2" placeholder="Password" required>
                  <span id="msg"></span>
                </div>
              </li>
            </ol>
          </fieldset>
          <button class="btn btn-md my-btn-log my-btn-full" type="submit">LOG IN</button>
        </form>
        
       
        <div class="login-choice-info">
          <p>
          	没有账号?<a href="signuppage">现在来注册吧</a>
          	<br>通过其他途径登陆
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