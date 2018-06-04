<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<div class="container">
		<div>
			<form action="signup.jsp" method="post">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>항목</th>
							<th>정보</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" id="id"
								name="id" value="" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="pwd" name="pwd"
								value="" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" id="email" name="email"
								value="" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" id="phone" name="phone"
								value="" /></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-default">회원가입</button>
				
			</form>




		</div>
	</div>
</body>
</html>