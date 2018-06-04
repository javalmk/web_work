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
<h3>세션영역에 id가 담겨 있는지 여부</h3>
<p>session 영역에 id가 있는지 여부:<strong>${not empty id}</strong></p>
<c:if test="${not empty id }">
<p><strong>${id}</strong>님 로그인중 ...</p>
</c:if>
</body>
</html>