<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test06.jsp</title>
</head>
<body>
<%
	//조건부로 특정 내용 출력하기 
	boolean isLogin=false;
%>
<h3>test06.jsp 페이지 입니다.</h3>
<%if(isLogin){ %>
	<p> <strong>kimgura</strong> 님 로그인중...</p>
<%}else{ %>
	<p> <a href="loginform.jsp">로그인</a></p>
<%} %>
</body>
</html>













