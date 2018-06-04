<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>인덱스 페이지 입니다</h3>
	<ul>
		<li><a href="member/list.do">회원 목록보기</a></li>
	</ul>
	<%
		List<String> news = (List<String>) request.getAttribute("news");
	%>
	<h3>공지사항</h3>
	<ul>
		<%
			for (String tmp : news) {
		%>
		<li><%=tmp%></li>
		<%
			}
		%>
	</ul>
</body>
</html>