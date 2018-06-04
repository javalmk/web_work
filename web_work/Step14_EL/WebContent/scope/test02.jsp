<%@page import="test.member.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test02.jsp</title>
</head>
<body>
<%
MemberDto dto = new MemberDto(1,"김구라","노량진");
//request 영역에 Memberdto type 저장하기
request.setAttribute("dto",dto);
%>
<h3>테스트2</h3>
<p>번호:${requestScope.dto.num }</p>
<p>이름:${dto.name }</p>
<p>주소:${dto.addr }</p>

<h3>위에 코드와 비교</h3>
<%
MemberDto dto2 = (MemberDto)request.getAttribute("dto");
%>
<p>번호 :<%=dto2.getNum() %></p>
<p>이름 :<%=dto2.getName() %></p>
<p>주소 :<%=dto2.getAddr() %></p>
</body>
</html>