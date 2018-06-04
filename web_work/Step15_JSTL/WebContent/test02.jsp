<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<String> list = new ArrayList<>();
list.add("김구라");
list.add("해골");
list.add("원숭이");
/* request 영역에 담기 */
request.setAttribute("friends", list);
%>
<h3>친구 목록입니다.</h3>
<ul>

<c:forEach var="i" items="${friends }">
<li>${i}</li>
</c:forEach>


</ul>
</body>
</html>