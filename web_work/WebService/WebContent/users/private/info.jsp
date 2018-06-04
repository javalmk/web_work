<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Kilogram</title>

<jsp:include page="/resources/resource.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/resources/header.jsp"></jsp:include>

	<div class="container">
		<div>

			<%
				String id = (String) session.getAttribute("id");
				UsersDto dto = UsersDao.getInstance().getData(id);
			%>
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
						<td><%=dto.getId()%></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=dto.getEmail()%></td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td><%=dto.getPhone()%></td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td><%=dto.getRegdate()%></td>
					</tr>
				</tbody>
			</table>

			<a href="update_form.jsp">회원정보 수정</a> <a href="javascript:deleteconfirm()">회원 탈퇴</a>

			


		</div>
	</div>
<script>
function deleteconfirm(){
	var isDelete=confirm("정말 탈퇴하시겠습니까?");
	if(isDelete){
		location.href="delete.jsp";
	}
}
</script>
</body>
</html>
