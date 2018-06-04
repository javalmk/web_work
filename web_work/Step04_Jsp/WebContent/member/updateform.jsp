<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateform.jsp</title>
</head>
<body>
<%
	//수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
    //회원정보를 읽어온다.
    MemberDto dto=MemberDao.getInstance().getData(num); 
%>
<h3>수정할 회원 정보 입니다.</h3>
<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
	<label for="name">이름</label>
	<input type="text" name="name" id="id" 
		value="<%=dto.getName()%>"/>
	<label for="addr">주소</label>
	<input type="text" name="addr" id="addr" 
		value="<%=dto.getAddr()%>"/>
	<button type="submit">수정</button>
</form>
</body>
</html>












