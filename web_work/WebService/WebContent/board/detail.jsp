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
int num = Integer.parseInt(request.getParameter("num"));
BoardDto dto=BoardDao.getInstance().getData(num);
FileDto fDto =FileDao.getInstance().getData(num);

%>
	<div class="container">
		<table class="table">
			<tbody>
				<tr>
					<th width="100">제목</th>	 <td><%=dto.getTitle() %></td>
				</tr>
				<tr>
					<th>작성자</th>	 <td><%=dto.getWriter() %></td>
				</tr>
				<tr height="500">
					<th>내용</th> <td><%=dto.getContent() %><br/><br/>
					<% if(fDto.getFilesize()!=0){ %>
					<img src="download.jsp?num=<%=num%>" width="600"/>
					<%} %>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th> <td>
					<% if(fDto.getFilesize()!=0){ %>
					<a href="download.jsp?num=<%=num%>"><%=fDto.getOrgFilename() %></a>
					<%}else{ %>
					첨부파일 없음
					<%} %>
					</td>
				</tr>
				<tr>
                <td colspan="2">
                    <input class="btn btn-default pull-right" type="button" value="글목록" onclick="javascript:location.href='${pageContext.request.contextPath}/index.jsp'"/>
                    
                <%if(dto.getWriter().equals((String)session.getAttribute("id"))){ %>    
                    <input class="btn btn-default pull-left" type="button" value="수정" onclick="javascript:location.href='${pageContext.request.contextPath}/board/update_form.jsp?num=<%=dto.getNum()%>'"/>              
                <%} %>
                </td>
            </tr>
			</tbody>
		</table>
		
		
	</div>
</body>
</html>