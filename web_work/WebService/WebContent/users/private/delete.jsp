<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
<%
//request.getparameter 아님!!(info 문에서 id 파라미터 넘긴적 없음!!) 세션에서 id 받아올것!!
String id=(String)session.getAttribute("id");
UsersDao.getInstance().delete(id);
session.invalidate();
%>
<script>

location.href="${pageContext.request.contextPath}/";
</script>
</body>
</html>