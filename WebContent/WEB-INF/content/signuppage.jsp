<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Sign up</title>
  
   <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.min.css">
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
        <form id="signup-form"  action="signup" method="post">
          <fieldset>
            <legend>
              	注册  <!-- 可换成其他的文字，暂时用这个 -->
            </legend>
            <ol>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                  <input type="text" id="user" class="form-control" name="signup_user.userName" tabindex="1" placeholder="Username" autofocus required>
                </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-pencil" aria-hidden="true"></i></span>
                  <input type="text" id="user" class="form-control" name="signup_user.nickname" tabindex="2" placeholder="Nickname" required>
                </div>
              </li>
              <li>
                <div class="form-group">
                  <select class="form-control" name="signup_user.sex" tabindex="3">
	                <option value="">-- 性别 --</option>
	                <option value=true>男</option>
	                <option value=false>女</option>                
	              </select>
	            </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                  <input type="password" id="user" class="form-control" name="signup_user.password" tabindex="4" placeholder="Password" required>
                </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                  <input type="password" id="pass" class="form-control" name="confirmpassword" tabindex="5" placeholder="Double confirm your password" required>
                </div>
              </li>
            </ol>
          </fieldset>
          <button class="btn btn-md my-btn-sign my-btn-full" type="submit">SIGN UP</button>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>