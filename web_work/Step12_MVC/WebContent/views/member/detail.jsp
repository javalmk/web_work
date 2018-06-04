<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/member/detail.jsp</title>
</head>
<body>
<%
	// request 에 담긴 MemberDto 객체의 참조값 얻어내기
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<p> 번호 : <strong><%=dto.getNum() %></strong></p>
<p> 이름 : <strong><%=dto.getName() %></strong></p>
<p> 주소 : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>








