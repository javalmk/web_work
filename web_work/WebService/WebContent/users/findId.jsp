<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
int phone=Integer.parseInt(request.getParameter("phone"));
String id=UsersDao.getInstance().findId(email, phone);
%>
<div class="container" align="center"> 

<p>아이디는 <%=id%>입니다.</p>
</div>
</body>
</html>