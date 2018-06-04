<%@page import="test.dto.FriendsDto"%>
<%@page import="test.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

 		if(!name.equals(null) &&!phone.equals(null)){
		FriendsDto dto = new FriendsDto();
		dto.setName(name);
		dto.setPhone(phone);
		FriendsDao.getInstance().insert(dto);
		} 
	%>
</body>
<script>
	alert("추가완료");
 	location.href = 'test01.jsp'; 
</script>
</html>