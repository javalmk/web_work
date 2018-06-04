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

<title>Login - Progressus Bootstrap template</title>
<!-- css/js -->
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
			<li><a href="index.html">Home</a></li>
			<li class="active">User access</li>
		</ol>

		<div class="row">

			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Login</h1>
				</header>

				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Login to your account</h3>
							<div align="center">
								<c:if test="${not empty msg }">
									<p style="color: #b64e4e;">
										<strong>${msg}</strong>
									</p>
								</c:if>
							</div>
							<form action="login.do" method="post">
								<div class="top-margin">
									<label for="id">ID <span class="text-danger">*</span></label> <input
										name="id" type="text" class="form-control">
								</div>
								<div class="top-margin">
									<label for="pwd">Password <span class="text-danger">*</span></label>
									<input type="password" name="pwd" class="form-control">
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-8">
										<b><a href="#">Forgot password?</a></b>
									</div>
									<div class="col-lg-4 text-right">
										<button class="btn btn-action" type="submit">Sign in</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>

			</article>
			<!-- /Article -->

		</div>
	</div>
	<!-- /container -->

	<!-- footer -->

	<jsp:include page="/resources/footer.jsp"></jsp:include>




</body>
</html>