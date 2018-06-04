<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03.jsp</title>
</head>
<body>
<%
	List<String> names=new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	names.add("주뎅이");
	names.add("덩어리");
%>
<h3>친구 목록</h3>
<ul>
	<li><%=names.get(0) %></li>
	<li><%=names.get(1) %></li>
	<li><%=names.get(2) %></li>
	<li><%=names.get(3) %></li>
	<li><%=names.get(4) %></li>
</ul>
<h3>친구 목록</h3>
<ul>
	<%for(int i=0; i<names.size(); i++){ %>
		<li><%=names.get(i) %></li>
	<%} %>	
</ul>
<h3>친구 목록</h3>
<ul>
	<%for(String tmp:names){ %>
		<li><%=tmp %></li>
	<%} %>
</ul>
</body>
</html>












