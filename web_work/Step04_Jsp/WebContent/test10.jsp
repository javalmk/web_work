<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test10.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<%
	//파라미터로 넘어오는 문자열을 읽어온다.
	String activeTab=request.getParameter("active");
	
	//만일 넘어 오지 않으면 
	if(activeTab==null){
		activeTab="one";
	}
%>
<div class="container">
	
	<h3>동적으로 active tab 바꾸는 연습</h3>
	<ul class="nav nav-tabs">
		<li <%if(activeTab.equals("one")){%>class="active"<%} %>>
			<a href="test10.jsp?active=one">하나</a>
		</li>
		<li <%if(activeTab.equals("two")){%>class="active"<%} %>>
			<a href="test10.jsp?active=two">두울</a>
		</li>
		<li <%if(activeTab.equals("three")){%>class="active"<%} %>>
			<a href="test10.jsp?active=three">세엣</a>
		</li>
	</ul>
</div>
</body>
</html>











