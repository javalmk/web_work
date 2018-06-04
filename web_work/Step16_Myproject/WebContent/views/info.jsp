<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>Sign up - Progressus Bootstrap template</title>
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
			<li class="active">Registration</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Registration</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">${id} 님의 회원정보</h3>

								<div class="top-margin">
									<label for ="id">ID</label>
									<input name="id" type="hidden" class="form-control" value="${id}">
									<input name="id" type="text" class="form-control" disabled value="${id}">
								</div>

								<div class="row top-margin">
									<div class="col-sm-6">
										<label for="pwd">Password <span class="text-danger">*</span></label>
										<input id="pwd" name="pwd" type="password" class="form-control" disabled value="${dto.pwd}">
									</div>
									<div class="col-sm-6">
										<label for="pwdc">Confirm Password <span class="text-danger">*</span></label>
										<input id="pwdc" name="pwdc" type="password" class="form-control" disabled value="${dto.pwd}">
									</div>
								</div>
								<div class="top-margin">
									<label for="email">Email Address <span class="text-danger">*</span></label>
									<input name="email" type="text" class="form-control" disabled value="${dto.email}">
								</div>
								<div class="top-margin">
									<label for="phone">Phone Number <span class="text-danger">*</span></label>
									<input name="phone" type="text" class="form-control" disabled value="${dto.phone}">
								</div>
								<div class="top-margin">
									<label for="regdate">Phone Number <span class="text-danger">*</span></label>
									<input name="regdate" type="text" class="form-control" disabled value="${dto.regdate}">
								</div>
								<hr>

								<div class="row">
									<div class="col-xs-4">
                                        <a href="delete.do"><button class="btn btn-danger" >회원탈퇴</button></a>
									</div>
									<div class="col-xs-4 text-right" style="float:right">
										<a href="update_form.do"><button class="btn btn-action" id="rbtn">수정</button></a>
									</div>
								</div>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
		
<!-- footer -->
		
<jsp:include page="/resources/footer.jsp"></jsp:include>


</body>
</html>