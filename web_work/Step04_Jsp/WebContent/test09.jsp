<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test09.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<%
	//String activeTab="one";
	String activeTab="two";
	//String activeTab="three";
%>
<div class="container">
	<h3>동적으로 active tab 바꾸는 연습</h3>
	<ul class="nav nav-tabs">
	<%if(activeTab.equals("one")){ %>
		<li  class="active" ><a href="#">하나</a></li>
		<li><a href="#">두울</a></li>
		<li><a href="#">세엣</a></li>
	<%}else if(activeTab.equals("two")){ %>
		<li><a href="#">하나</a></li>
		<li class="active"><a href="#">두울</a></li>
		<li><a href="#">세엣</a></li>
	<%}else if(activeTab.equals("three")){%>
		<li><a href="#">하나</a></li>
		<li><a href="#">두울</a></li>
		<li class="active"><a href="#">세엣</a></li>
	<%} %>
	</ul>
	
	<h3>동적으로 active tab 바꾸는 연습</h3>
	<ul class="nav nav-tabs">
		<li <%if(activeTab.equals("one")){%>class="active"<%} %>><a href="#">하나</a></li>
		<li <%if(activeTab.equals("two")){%>class="active"<%} %>><a href="#">두울</a></li>
		<li <%if(activeTab.equals("three")){%>class="active"<%} %>><a href="#">세엣</a></li>
	</ul>
</div>
</body>
</html>











