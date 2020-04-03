<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "User.userDAO"%> 
<jsp:useBean id="user" class="User.user" scope="page"/>
<!-- 자바빈 객체를 생성 id-생성될 자바빈 객체이름, class-객체가 생성될 자바빈 클래스, scope-공유범위 -->
<jsp:setProperty name="user" property="userId"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>
<!-- 자바빈에 property값을 저장 name-자바빈객체의 이름, property-사용할property 이름 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(user.getUserId()==null || user.getUserPassword()==null || user.getUserName()==null || user.getUserEmail()==null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 사항이 있습니다!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			userDAO uDAO = new userDAO();
			int result = uDAO.join(user);
			if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");	
				script.println("alert('이미 존재하는 아이디입니다!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				session.setAttribute("userId", user.getUserId());
				PrintWriter script = response.getWriter();
				script.println("<script>");	
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>