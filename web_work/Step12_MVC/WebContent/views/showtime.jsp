<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/showtime.jsp</title>
</head>
<body>
<%
	String time=(String)request.getAttribute("time");
%>
<p> 현재 시간 : <strong><%=time %></strong></p>
<p> 현재 시간 : <strong>${time }</strong></p>
</body>
</html>








