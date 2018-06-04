<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

<title>Board</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
</head>

<body>
	<!-- Fixed navbar -->
	<jsp:include page="/resources/topnavbar.jsp"></jsp:include>
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
			<li class="active">Board</li>
		</ol>

		<div class="row">

			<!-- Article main content -->
			<article class="maincontent">
				<header class="page-header">
					<h1 class="page-title">게시판</h1>
				</header>

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
								<td><a
									href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${keyword}">${tmp.title }</a></td>
								<td>${tmp.writer }</td>
								<td>${tmp.viewCount }</td>
								<td>${tmp.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 처리에 관련된 UI -->
				<div class="page_display" align="center" >
					<nav>
						<ul class="pagination">
							<c:choose>
								<c:when test="${startPageNum ne 1 }">
									<li><a href="list.do?pageNum=${startPageNum-1 }">
											&laquo; </a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:"> &laquo; </a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
								<c:choose>
									<c:when test="${i eq pageNum }">
										<li class="active"><a
											href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${endPageNum lt totalPageCount }">
									<li><a href="list.do?pageNum=${endPageNum+1 }">
											&raquo; </a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:"> &raquo; </a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
				<div>
					<form action="list.do" method="post">
						<div class="col-xs-2 col-xs-offset-3" style="padding-right: 0;">
							<select class="form-control" name="condition" id="condition">
								<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
								<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
								<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="col-xs-4" style="padding-left: 0;">
							<div class="input-group">
								<!-- /btn-group -->
								<input type="text" class="form-control" value="${keyword }" name="keyword">
								<div class="input-group-btn">
									<button class="btn btn-default pull-right" type="submit">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</div>
							</div>
					</form>
				</div>
			</article>
		</div>
	</div>
	<!-- /container -->

	<section class="container-full top-space">
		<div id="map"></div>
	</section>


	<!-- footer -->
	<jsp:include page="/resources/footer.jsp"></jsp:include>

</body>
</html>



















