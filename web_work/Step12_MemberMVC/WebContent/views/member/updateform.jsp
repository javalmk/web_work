<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MemberDto dto = (MemberDto)request.getAttribute("dto");
System.out.println(dto.getNum());
System.out.println(dto.getName());
System.out.println(dto.getAddr());
%>
<h3>회원 수정 폼입니다.</h3>
	<form action="update.do" method="post">
		<input type="hidden" name="num" id="num" value="<%=dto.getNum()%>"/>
		<label for="num">번호</label> <input type="text" disabled name="num" id="num" value="<%=dto.getNum()%>"/>
		<label for="name">이름</label> <input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
		<label for="addr">주소</label> <input type="text" name="addr" id="addr" value="<%=dto.getAddr()%>" />
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</form>

</body>
</html>