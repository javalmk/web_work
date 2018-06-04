<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String email=request.getParameter("email");
int phone=Integer.parseInt(request.getParameter("phone"));
boolean isValid=UsersDao.getInstance().findPwd(id,email, phone);
//입력된 정보가 맞다면 임시 비밀번호를 abcd로 한다.
if(isValid){
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setPwd("abcd");
	UsersDao.getInstance().update(dto);
%>
<div class="container" align="center"> 

	<p>임시비밀번호는 <strong>abcd</strong> 입니다. 회원정보에서 비밀번호를 다시 수정해주세요</p>
<%}else{ %>
	<p>입력된 정보가 올바르지 않습니다.</p>
<%} %>
</div>

</body>
</html>