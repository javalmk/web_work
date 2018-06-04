<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/resource.jsp"></jsp:include>
<title>게시물</title>
</head>
<body>
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<%
		List<FileDto> list = FileDao.getInstance().getList();
	%>
	<div class="container">
		<h1>자료실</h1>



		<a href="${pageContext.request.contextPath}/index.jsp"><button
				class="btn btn-default">
				<span class="glyphicon glyphicon-list"></span>
			</button></a> <a class="pull-right" href="javascript:isLogin()"><button
				class="btn btn-default">
				<span class="glyphicon glyphicon-pencil"></span>
			</button></a>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>파일명</th>
					<th>파일크기</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (FileDto tmp : list) {
				%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWriter()%></td>
					<td width="700"><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFilename()%></a></td>
					<td><%=tmp.getFilesize()%></td>
					<td><%=tmp.getRegdate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>
	<script>
		//로그인 되었을때만 게시글쓸수 있게
		function isLogin() {
	<%if (session.getAttribute("id") != null) {%>
		location.href = "${pageContext.request.contextPath}/board/write_form.jsp";
	<%} else {%>
		alert("로그인 후 글을 작성할 수 있습니다.");
			location.href = "${pageContext.request.contextPath}/users/login_form.jsp"
	<%}%>
		}
	</script>
</body>
</html>