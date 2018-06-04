<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/member/list.jsp</title>
</head>
<body>
<%
	//request 에 담긴 회원 목록을 얻어낸다.
	List<String> list=(List<String>)request.getAttribute("list");
%>
<h3>회원 목록입니다.</h3>
<ul>
	<%for(String tmp:list){ %>
		<li><%=tmp %></li>
	<%} %>
</ul>
</body>
</html>










