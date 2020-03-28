<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html" charset="UTF-8">
<meta name = "viewport" content="width=device-width" inital-scale="1">
<!-- viewport 코드가 없으면 모바일기기로 접속할 때 문제가 발생함 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>MyPractice</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
%>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggled="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main.jsp">내 사리사욕 게시판</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="main.jsp">메인</a>
			<li><a href="https://tgd.kr/ddahyoni">따게더</a>
			<li><a href="https://www.twitch.tv">트위치</a>
			<li><a href="https://okky.kr">okky</a>
			<li><a href="bbs.jsp">게시판</a>
		</ul>
		<%
			if(userID==null){
		%>
		<ul class="navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a>
					<li><a href="join.jsp">회원가입</a>
				</ul>
			</li>
		</ul>
		<%
			}else{
		%>
		<ul class="navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logout.jsp">로그아웃</a>
				</ul>
			</li>
		</ul>
		<%
			}
		%>
	</div>
</nav>

<!-- 여기까지가 네비게이션 구현 단계 -->
<div class="container">
<div class="col-lg-4"></div>
	<div class="jumbotron" style="padding-top:20px">
		<form action="secretAction" method="post">
			<h2 style="text-align:center;">본인 확인을 위한 질문들</h2>
			<div class="form-group">
			내가 현재 사용하는 핸드폰 기종은?
			<input type="text" placeholder="??????" name="myPhone">
			</div>
			<div class="form-group">
			My DB root password
			<input type="password" name="myPassword">
			</div>
			<div class="form-group">
			<input type="submit" value="제출하기">
			</div>
		</form>
	</div>
	<div class="col-lg-4"></div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>