<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/member/updateform.jsp</title>
</head>
<body>
<h3>회원정보 수정 폼</h3>
<form action="update.do" method="post">
	<input type="hidden" name="num" value="${dto.num }"/>
	번호 <input type="text" value="${dto.num }" disabled/> <br/>
	이름 <input type="text" name="name" value="${dto.name }"/><br/>
	주소 <input type="text" name="addr" value="${dto.addr }"/><br/>
	<button type="submit">수정확인</button>
</form>
</body>
</html>










