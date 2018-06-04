<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
<h3>카페 글 목록입니다.</h3>
<a href="private/insertform.do">새글쓰기</a>
<table class="table">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="tmp" items="${list }">
		<tr>
			<td>${tmp.num }</td>
			<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${keyword}">${tmp.title }</a></td>
			<td>${tmp.writer }</td>
			<td>${tmp.viewCount }</td>
			<td>${tmp.regdate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<!-- 페이징 처리에 관련된 UI -->
<div class="page_display" align="center">
<nav>
<ul class="pagination">
	<c:choose>
		<c:when test="${startPageNum ne 1 }">
			<li><a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a></li>
		</c:when>
		<c:otherwise>
			<li class="disabled"><a href="javascript:">&laquo;</a></li>
		</c:otherwise>
	</c:choose>

	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${i eq pageNum }">
				<li class="active"><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:choose>
		<c:when test="${endPageNum lt totalPageCount }">
			<li><a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a></li>
		</c:when>
		<c:otherwise>
			<li class="disabled"><a href="javascript:">&raquo;</a></li>
		</c:otherwise>
	</c:choose>
	</ul>
	</nav>
</div>
<!-- 검색어 관련 form -->
<form action="list.do" method="post">
	<label for="condition">검색조건</label>
	<select name="condition" id="condition">
		<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if> >제목+내용</option>
		<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
		<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
	</select>
	<input value="${keyword }" type="text" name="keyword" placeholder="검색어"/>
	<button type="submit">검색</button>
</form>
</div>
</body>
</html>



















