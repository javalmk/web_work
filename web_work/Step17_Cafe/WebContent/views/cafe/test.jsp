<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--attribute에 검색어가 있다면?  -->
<c:if test="${not empty keyword }">
<!-- 검색어를 출력하고 -->
<p>검색어: <strong>${keyword }</strong></p>
</c:if>
<div>
<!-- prevNum이 0이아니면 이전글 표시-->
<c:if test="${dto.prevNum ne 0}">
<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}">이전글</a>
</c:if>
<!-- nextNum이 0이아니면 다음글 표시-->
<c:if test="${dto.nextNum ne 0}">
<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}">다음글</a>
</c:if>
</div>
<!-- 글 상세 페이지 내용 출력하기 -->
<table>
<tr>
<th>글번호</th>
<td>${dto.num }</td>
</tr>
<tr>
<th>작성자</th>
<td>${dto.writer }</td>
</tr>
<tr>
<th>제목</th>
<td>${dto.title }</td>
</tr>
</table>
<div class="content">${dto.content }</div>
<!-- 댓글 목록 출력 -->
<div class="commnets">
<c:forEach var="tmp" items="${commentList }">
<!-- commentList의 num 이 comment-group과 다르다면 들여쓰기 style적용하기-->
<div class="comment" <c:if test="${tmp.num ne tmp.comment_group}">style="margin-left:100px"</c:if>>
	<!-- commentList의 num 이 comment-group과 다르다면 리플 div 적용 -->
	<c:if test="${tmp.num ne tmp.comment_group }">
		<div class="reply_icon"></div>
	</c:if>
	<div>
	<!-- 댓글에 대한 댓글창 -->
	작성자 <strong>${tmp.writer }</strong>
	${tmp.regdate }<br/>
	<strong>${tmp.target_id }</strong>님 에게
	<a href="javascript:">답글</a>
	</div>
	<textarea rows="5" disabled>${tmp.content}</textarea>
	<!-- 댓글작성창 -->
	<form action="comment_insert.do" method="post">
	<input type="hidden" name="writer" value="${id }" />
	<input type="hidden" name="ref_group" value="${dto.num }" />
	<input type="hidden" name="target_id" value="${tmp.writer }" />
	<input type="hidden" name="comment_group" value="${tmp.comment }" />
	<textarea name="content"></textarea>
	<button type="submit">등록</button>
	</form>
</div>
</c:forEach>
</div>
<!-- 원글에 대한 댓글 입력 폼 -->
<div class="comment_form">
<form action="comment_insert.do" method="post">
<input type="hidden" name="writer" value="${id }" />
<input type="hidden" name="ref-group" value="${dto.num }" />
<input type="hidden" name="target_id" value="${dto.writer }" />
<textarea name="content"></textarea>
<button type="submit">등록</button>
</form>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
<script>
var isLogin=${isLogin};

$(".comment_form > form, .comment form").submit(function(){
	if(!isLogin){
		alert("로그인이 필요합니다.");
		//로그인페이지로 이동
		location.href="${pageContext.requst.contextPath}/users/login_form.do?url=${pageContext.request.contextPath}/cafe/detail.do?num={dto.num}"
		return false;
	}
});
$(".comment a").click(function(){
	if($(this).text()=="답글"){
		$(this).text("취소").parent().parent().find("form").slideToggle();
	}else{
		$(this)
		.text("답글")
		.parent()
		.parent()
		.find("form")
		.slideToggle();
	}
	)};

	function deleteCheck(){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.do?num=${dto.num}";
		}
	};
</script>
</body>
</html>