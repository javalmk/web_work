<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
String regdate=request.getParameter("regdate");
int phone = Integer.parseInt(request.getParameter("phone"));

UsersDao.getInstance().update(new UsersDto(id,pwd,email,phone,regdate));

%>
<script>
alert("<%=id%>님 회원정보가 변경 되었습니다.")
location.href="info.jsp";
</script>
</body>

</html>