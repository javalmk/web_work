<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.FriendsDao"%>
<%@page import="test.dto.FriendsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h3>친구들 전화번호들</h3>
		<form action="insert.jsp" method="post">
			<label for="name">이름</label> <input type="text" name="name" id="name" />
			<label for="phone">전화</label> <input type="text" name="phone" id="phone" />
			<button class="btn btn-default" type="submit">추가</button>
			<button class="btn btn-default" type="reset">취소</button>
		</form>
		<%
		List<FriendsDto> li = FriendsDao.getInstance().getList();
	%>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>전화</th>
					<th>날짜</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (FriendsDto tmp : li) {
			%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getName()%></td>
					<td><%=tmp.getPhone()%></td>
					<td><%=tmp.getRegdate()%></td>
					<td><a href="friends/delete.jsp?num=<%=tmp.getNum()%>"></a></td>
					<td><a href="friends/update.jsp?num=<%=tmp.getNum()%>"></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
<script>

</script>
</html>