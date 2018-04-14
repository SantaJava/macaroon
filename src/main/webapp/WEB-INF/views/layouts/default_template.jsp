<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 모든 부분에서 공통적으로 쓰이는 것 여기에 넣을 것. (ex 부트스트랩 등.) -->


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!--  material design bootstrap stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css" />
<!-- font awesome -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.9/js/all.js"
	integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
	crossorigin="anonymous"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<!-- Bootstrap 4.0 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style>
body{
background-color : #FDF3D3;
}

.error {
	color: red;
}

.jumbotron {
	background-color: #800080;
	color: #ffffff;
	margin: 0;
	border-radius: 0;
}

.jumbotron i {
	color: #FFFF33;
}

.jumbotron h1 {
	font-family: "Arial Rounded MT Bold", "Helvetica Rounded";
	color: #FFFF33;
}


.navbar {
	margin-bottom: 0;
	background-color: #800080;
	border: 0;
	font-size: 15px;
	line-height: 1.42857143;
	letter-spacing: 4px;
	border-radius: 0;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-brand:hover, .navbar-nav li.active a {
	color: #FFFF33 !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #FFFF33 !important;
}

.btn-primary {
    background-color:  #800080 !important;
}

#reply_content{
	resize : none;
	background-color : white;
	height : 100px;
	border : none;
	
}

</style>

</head>
<body>
	<div class="container">
		<header> <tiles:insertAttribute name="header" /> </header>
		<nav> <tiles:insertAttribute name="menu" /> </nav>
		<div>
			<tiles:insertAttribute name="body" />
		</div>
		<footer> <tiles:insertAttribute name="footer" /> </footer>
	</div>
</body>
</html>