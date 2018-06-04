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
String msg=(String)request.getAttribute("msg");
String url=(String)request.getAttribute("url");
%>
<p><%=msg %></p>
<a href="${pageContext.request.contextPath}<%=url %>">확인</a>
</body>
</html>