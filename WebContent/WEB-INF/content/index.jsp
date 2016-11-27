<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>首页</title>
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" sizes="180x180" href="assets/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" href="assets/images/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="assets/images/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="assets/images/manifest.json">
	<link rel="mask-icon" href="assets/images/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="theme-color" content="#ffffff">

  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:800,400">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Catamaran:800,300,100">
  <link rel="stylesheet" type="text/css" href="assets/css/normalize.css">
  <link rel="stylesheet" type="text/css" href="assets/css/default.css">   
  <link rel="stylesheet" type="text/css" href="assets/css/index.css">  
  <link rel="stylesheet" type="text/css" href="assets/css/indexpreload.css">  
 
</head>
<body>
  <div id="loading">
    <div id="loading-center">
      <div id="loading-center-absolute">
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
	  </div>
    </div>
  </div>       
  
  <div class="overlay"></div>
  <nav class="navbar navbar-default navbar-fixed-top my-navbar" role="navigation">
    <div class="container-fluid container my-nav">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <span class="navbar-brand">LETS GO DUTCH</span>
      </div>
      <div id="menu" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right my-navbar-menu">
          <li class="btn-2"><a href="index">首页</a></li>
          <!-- 考虑about制作模态框，嵌入网站的demo -->
		  <li class="btn-2"><a href="About">关于</a></li>		
        </ul>
      </div>
    </div>
  </nav>

  <main>
    <div class="container">
      <div class="row center-content">
        <div class="col-md-offset-3 col-md-6 col-sm-12">
          <div class="text-center my-text">
            <h1>Lets Go Dutch</h1>
            <h2>Whenever and Wherever</h2>
            <span>Have a good time !</span>
          </div>
          <div class="row">
            <div class="col-xs-6 text-right">
              <a class="btn btn-md my-btn my-btn-border" href="signuppage" type="button">
                注册
              </a>
            </div>
            <div class="col-xs-6">
              <a class="btn btn-md my-btn my-btn-full" href="loginpage" type="button">
                登录
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
 </main>

  <script type="text/javascript" src="assets/js/jquery-2.0.2.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(window).load(function() {
	  $("#loading").fadeOut(500);  //在页面加载完成之后0.5秒的时间内将loading动画淡入淡出隐藏起来
	});
  </script>
</body>
</html>
