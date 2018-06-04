<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test5/main.jsp</title>
<style>
	.header{
		height: 100px;
		background-color: yellow;
	}
	.footer{
		height: 100px;
		background-color: pink;
	}
</style>
</head>
<body>
<jsp:include page="fragment/header.jsp"></jsp:include>
<div class="main">
	<h3>메인 컨텐츠 입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas mollitia alias dolorem quibusdam quidem ducimus doloremque sint quam odit harum nemo provident similique odio laudantium reprehenderit incidunt sapiente earum atque.</p>
</div>
<jsp:include page="fragment/footer.jsp"></jsp:include>
</body>
</html>






