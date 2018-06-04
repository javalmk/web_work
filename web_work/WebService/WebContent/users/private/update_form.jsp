<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
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

			<%
				String id = (String) session.getAttribute("id");
				UsersDto dto = UsersDao.getInstance().getData(id);
			%>
			<form action="update.jsp" method="post">
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
							<td><input type="hidden" name="id" value="<%=id%>"/>
							<input type="text" disabled="disabled" id="id"
								name="id" value="<%=dto.getId()%>" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="pwd" name="pwd"
								value="<%=dto.getPwd()%>" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" id="email" name="email"
								value="<%=dto.getEmail()%>" /></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input type="text" id="phone" name="phone"
								value="<%=dto.getPhone()%>" /></td>
						</tr>
						<tr>
							<th>가입날짜</th>
							<td><input type="hidden" name="regdate" value="<%=dto.getRegdate()%>"/>
							<input type="text" disabled="disabled" id="regdate"
								name="regdate" value="<%=dto.getRegdate()%>" /></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-default">회원 정보 수정</button>
				
			</form>




		</div>
	</div>
</body>
</html>