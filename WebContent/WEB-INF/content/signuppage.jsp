<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">

  	<title>注册</title>

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
  <link rel="stylesheet" type="text/css" href="assets/css/bootstrapValidator.min.css">
  
  <style type="text/css">
	.has-error .help-block {
	    color: #FFE869;
	}
  </style>
  
</head>
<body>
  <div class="wrapper">
    <div class="overlay"></div>
    <div class="content-container">
      <div class="logsign-header">
        <!-- 考虑用网站的icon什么的，暂时留白 -->
      </div>
      <div class="logsign-content">
        <form id="signup-form" action="signup" method="post">
          <fieldset>
            <legend>
              	注册  <!-- 可换成其他的文字，暂时用这个 -->
            </legend>
            <ol>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                  <input type="text" id="username" class="form-control" name="signup_user.userName" 
                  	tabindex="1" placeholder="用户名" autofocus />
                </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-pencil" aria-hidden="true"></i></span>
                  <input type="text" id="nickname" class="form-control" name="signup_user.nickname" 
                  	tabindex="2" placeholder="昵称" />
                </div>
              </li>
              <li>
                <div class="form-group">
                  <select id="gender" class="form-control" name="signup_user.sex" tabindex="3">
	                <option value="">-- 性别 --</option>
	                <option value=true>男</option>
	                <option value=false>女</option>                
	              </select>
	            </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                  <input type="password" id="pass" class="form-control" name="signup_user.password" 
                  	tabindex="4" placeholder="密码" />
                </div>
              </li>
              <li>
                <div class="form-group">
                  <span class="input-icon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                  <input type="password" id="ensurepass" class="form-control"
                  	tabindex="5" placeholder="确认密码" /> 
                  	<small id="helpPass" class="help-block" style="color:#FFE869; display: none;">两次输入的密码不一致?</small>
                </div>
              </li>
            </ol>
          </fieldset>
          <button id="submitBtn" class="btn btn-md my-btn-sign my-btn-full" type="submit">注册</button>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
  <script>
  	
  	$(document).ready(function() {
	    $('#signup-form').bootstrapValidator({
	        fields: {
	        	userName: {
	        	 	selector: '#username',	
	                validators: {
	                	notEmpty: {
	                		message: '你的名字是?'
	                	},
	                    stringLength: {
	                        min: 6,
	                        max: 12,
	                        message: '用户名只能在6-12个字符之间哦~'
	                    }
	                }
	            },
	            nickname: {
	            	selector: '#nickname',
	                validators: {
	                	notEmpty: {
	                		message: '你的昵称是?'
	                	},
	                    stringLength: {
	                        min: 3,
	                        max: 10,
	                        message: '昵称只能在3-10个字符之间哦~'
	                    }
	                }
	            },
	            gender: {
	            	selector: '#gender',
	            	validators: {
	            		notEmpty: {
	            			message: '这是必选字段~'
	            		}
	            	}
	            	
	            },
	            pass: {
	            	selector: '#pass',
	            	validators: {
	            		notEmpty: {
	            			message: '密码不能为空~'
	            		},
			            stringLength: {
		                    min: 3,
		                    max: 6,
		                    message: '密码必须在3-6个字符之间~'
		                },
		                regexp: {
		                    regexp: /^[a-zA-Z0-9]+$/,
		                    message: '密码只能由字母、数字组成~'
		                }
	            	}
	            },
	            ensurepass: {
	            	selector: '#ensurepass',
	            	validators: {
	            		notEmpty: {
	            			message: '请再次确认一下你的密码哦~'
	            		}
	            	}
	            }
	           
	        }
	    });
	    
	    $('#ensurepass').blur(function(){
	    	var pass = document.getElementById('pass').value;
	    	var ensurepass = document.getElementById('ensurepass').value;
	    	var help = document.getElementById('helpPass');
	    	var submitBtn = document.getElementById('submitBtn');
	    	if (pass != ensurepass) {
	    		help.style.display = 'inline';
	    		submitBtn.setAttribute('disabled', 'disabled');
	    	} else {
	    		help.style.display = 'none';
	    	}
	    });
	    
	    
	});
  	
  	
  </script>
</body>
</html>