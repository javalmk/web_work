<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login_form.jsp</title>
</head>
<body>
<%String msg=(String)request.getAttribute("msg");

System.out.println(msg);
%>
<h3>로그인 페이지 입니다.</h3>
<form action="login.do" method="post">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id"/>
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/>
	<button type="submit">로그인</button>
</form>
<script>
if("<%=msg%>"!="null"){
	alert("<%=msg%>");
}

</script>
</body>
</html>







