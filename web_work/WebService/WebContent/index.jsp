<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Mungstargram</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<div class="container">
			
		
		
		
			<%
				boolean canPopup = true;
				Cookie[] cookies = request.getCookies();
				for (Cookie tmp : cookies) {
					if (tmp.getName().equals("popup")) {
						canPopup = false;
					}
				
				}
			%>
			<h1>BOARD</h1>
			
			
			<a href="board/filelist.jsp"><button class="btn btn-default">
					<span class="glyphicon glyphicon-floppy-disk"></span></button></a>
			<a class="pull-right" href="javascript:isLogin()"><button class="btn btn-default">
					<span class="glyphicon glyphicon-pencil"></span></button></a>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					
					List<BoardDto> list=BoardDao.getInstance().getList();
						for (BoardDto tmp : list) {
					%>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td width="700"><a href="board/detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a></td>
						<td><%=tmp.getRegdate()%></td>
						<td>조회수</td>
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
		location.href = "board/write_form.jsp";
	<%} else {%>
		alert("로그인 후 글을 작성할 수 있습니다.");
		location.href = "users/login_form.jsp"
	<%}%>
		}

		//canPopup이 true이면 팝업창 뜨게
	<%if (canPopup) {%>
		window.open("popup_page.jsp", "팝업창", "width=300, height=300, left=100");
	<%}%>
	
	</script>
</body>
</html>