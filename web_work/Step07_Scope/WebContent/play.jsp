<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>play.jsp</title>
</head>
<body>
<%
	//session 에 담긴 내용을 읽어온다.
	String id=(String)session.getAttribute("id");
%>
<%if(id==null){ %>
	<a href="users/loginform.jsp">로그인</a>
<%}else{ %>
	<p> <strong><%=id %></strong> 회원님 로그인중...</p>
<%} %>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit debitis nam cumque doloremque iusto saepe necessitatibus vitae itaque suscipit ipsum aliquam doloribus aperiam dolorum dolorem nulla! Vero mollitia qui debitis.</p>
</body>
</html>

















