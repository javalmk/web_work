<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kilogram</title>
</head>
<body>
	


</body>
<script>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String remember = request.getParameter("remember");
UsersDto dto = new UsersDto();
List<Cookie> cookies = new ArrayList<>();
dto.setId(id);
dto.setPwd(pwd);
if(remember!=null){
	cookies.add(new Cookie("rememberid",id));
	cookies.add(new Cookie("rememberpwd",pwd));
	for(Cookie tmp: cookies){
		tmp.setMaxAge(60);
		response.addCookie(tmp);
	}
}
boolean isValid = UsersDao.getInstance().isValid(dto);
if (isValid) {
	//로그인 성공후 이동할 경로
	//String url = request.getParameter("url");
	//세션에 아이디가 키이고 String id가 카값인것으로 지정
	session.setAttribute("id", id);
%>
location.href="${pageContext.request.contextPath}";
<%} else {%>

alert("아이디와 비밀번호를 확인해주세요");


location.href="login_form.jsp"
<%}%>
</script>
</html>