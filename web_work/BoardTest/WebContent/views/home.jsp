<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Blog Post - Start Bootstrap Template</title>

<!-- CSS/JS -->
<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>

<body>

	<!-- Navigation -->
	<jsp:include page="/resources/navigation.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg-8">

				<!-- Title -->
				<h1 class="mt-4">광고</h1>
				


			</div>

			<!-- Sidebar Widgets Column -->
			<jsp:include page="/resources/sidebar.jsp"></jsp:include>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="/resources/footer.jsp"></jsp:include>

</body>

</html>
