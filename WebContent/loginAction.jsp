<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "User.userDAO"%> 
<jsp:useBean id="user" class="User.user" scope="page"/>
//자바빈 객체를 생성 id-생성될 자바빈 객체이름, class-객체가 생성될 자바빈 클래스, scope-공유범
<jsp:setProperty name="user" property="userId"/>
<jsp:setProperty name="user" property="userPassword"/>
//자바빈에 property값을 저장 name-자바빈객체의 이름, property-사용할propertydmldlfma

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
	//유저의 정보를 유지하기 위해서는 세션이 더 안정적, 보안적임
		if(session.getAttribute("userId")!=null){
			userID = (String)session.getAttribute("userId");
			//session.getAttribute는 userId값을 리턴한다
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(이미 로그인이 되어있습니다!)");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		userDAO uDAO = new userDAO();
		int result = uDAO.login(user.getUserId(),user.getUserPassword());
		if(result==1){
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB에 문제가 생겼습니다!')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>