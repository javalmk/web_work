<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
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
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
int phone = Integer.parseInt(request.getParameter("phone"));
UsersDto dto = new UsersDto();
dto.setId(id);
dto.setPwd(pwd);
dto.setEmail(email);
dto.setPhone(phone);
//회원 추가
UsersDao.getInstance().insert(dto);
//세션에 아이디담아서 자동 로그인 되게!
session.setAttribute("id", id);
%>
<script>
alert("회원가입이 완료 되었습니다.");
location.href="${pageContext.request.contextPath}/";
</script>
</body>

</html>