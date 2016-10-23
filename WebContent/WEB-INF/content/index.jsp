<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Homepage</title>

  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:800,400">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Catamaran:800,300,100">

  <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
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
          <li class="btn-2"><a href="index">HOME</a></li>
		  <li class="btn-2"><a href="About">ABOUT</a></li>		
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
              <a class="btn btn-md my-btn my-btn-border" href="#" type="button">
                SIGN UP
              </a>
            </div>
            <div class="col-xs-6">
              <a class="btn btn-md my-btn my-btn-full" href="loginpage" type="button">
                LOG IN
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
 </main>

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
