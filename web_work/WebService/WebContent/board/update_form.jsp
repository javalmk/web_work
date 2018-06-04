<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<div class="container">
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDto dto = BoardDao.getInstance().getData(num);

		%>
		<table class="table table-hover">
			<thead>
			<caption>글쓰기</caption>
			</thead>
			<tbody>
				<form action="update.jsp" method="post" name="myForm"
					encType="multipart/form-data">
					<tr>
						<th>작성자:</th>
						<td>
							<input type="hidden" name="num" id = "num" value="<%=num%>"/>
							<input type="hidden" name="id" id="id"
							value="<%=session.getAttribute("id")%>" /> <input type="text"
							disabled="disabled" name="id" id="id" class="form-control"
							value="<%=session.getAttribute("id")%>" /></td>
					</tr>
					<tr>
						<th>제목:</th>
						<td><input type="text" name="title" id="title" value="<%=dto.getTitle() %>"
							class="form-control" /></td>
					</tr>

					<tr>
						<th>내용:</th>
						<td><textarea cols="10" rows="20" name="content" id="content"
								class="form-control"><%=dto.getContent() %></textarea></td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" placeholder="파일을 선택하세요. "
							name="myFile" id="myFile" class="form-control" />
							</td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- 수정 -->
							<input class="btn btn-default pull-right"
							type="button" value="수정 등록" onclick="sendData()" /> <input
							class="btn btn-default pull-left" type="button" value="글삭제" onclick="javascript:location.href='${pageContext.request.contextPath}/board/delete.jsp?num=<%=num%>'"/>
							<!-- 글목록 -->
							<input class="btn btn-default pull-right" type="button"
							value="글 목록"
							onclick="javascript:location.href='${pageContext.request.contextPath}/index.jsp'" />
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
	<script>
		function sendData() {
			document.myForm.submit();
		}
	</script>
</body>
</html>