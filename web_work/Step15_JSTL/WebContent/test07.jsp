<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.setAttribute("id", "gura");
%>
<h3>c:choose 를 활용한 if else 문 구성하기</h3>
<c:choose>
<c:when test="${empty id }">
<a href="Loginform.jsp">로그인</a>
</c:when>
<c:otherwise>
<p>${id }님 로그인중</p>
</c:otherwise>
</c:choose>
</body>
</html>