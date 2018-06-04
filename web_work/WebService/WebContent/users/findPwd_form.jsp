<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/resource.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
<form action="findPwd.jsp" method="post">
	<table class="table">
		<tbody>
			<tr>
				<th>아이디:</th>
				<td><input type="text" name="id" id = "id"/></td>
			</tr>
			<tr>
				<th>이메일:</th>
				<td><input type="text" name="email" id = "email"/></td>
			</tr>
			<tr>
				<th>전화번호:</th>
				<td><input type="text" name="phone" id= "phone"/></td>
			</tr>
		</tbody>
	</table>
	<div class="container" align="center">
		<button type="submit" class="btn btn-default">비밀번호 찾기</button>
	</div>
</form>
</body>
</html>