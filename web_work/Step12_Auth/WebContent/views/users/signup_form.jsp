<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup_form.jsp</title>
</head>
<body>
<form action="signup.do" method="post">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id"/><br/>
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/><br/>
	<label for="email">이메일</label>
	<input type="email" name="email" id="email"/><br/>
	<label for="phone">전화번호</label>
	<input type="text" name="phone" id="phone"/><br/>
	<button type="submit">가입</button>
</form>
</body>
</html>