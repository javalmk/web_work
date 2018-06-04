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
							<h3 class="thin text-center">Update account</h3>
							<form action="update.do" action="post">
								<div class="top-margin">
									<label for ="id">ID</label>
									<input name="id" type="hidden" class="form-control" value="${id}">
									<input name="id" type="text" class="form-control" disabled value="${id}">
								</div>

								<div class="row top-margin">
									<div class="col-sm-6">
										<label for="pwd">Password <span class="text-danger">*</span></label>
										<input id="pwd" name="pwd" type="password" class="form-control" value="${dto.pwd}">
									</div>
									<div class="col-sm-6">
										<label for="pwdc">Confirm Password <span class="text-danger">*</span></label>
										<input id="pwdc" name="pwdc" type="password" class="form-control" value="${dto.pwd}">
									</div>
								</div>
								<div class="top-margin">
									<label for="email">Email Address <span class="text-danger">*</span></label>
									<input name="email" type="text" class="form-control" value="${dto.email}">
								</div>
								<div class="top-margin">
									<label for="phone">Phone Number <span class="text-danger">*</span></label>
									<input name="phone" type="text" class="form-control" value="${dto.phone}">
								</div>
								<hr>

								<div class="row">
									<div class="col-lg-8">

									</div>
									<div class="col-lg-4 text-right">
										<button class="btn btn-action" id="rbtn" type="submit">수정완료</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
		
<!-- footer -->
		
<jsp:include page="/resources/footer.jsp"></jsp:include>

<script>
$("#myForm").submit(function(){

	var inputPwd=$("#pwd").val();
	var inputPwd2=$("#pwdc").val();
	if(inputPwd!=inputPwd2){
		alert("비밀번호가 일치하지않습니다.");
		$("#pwd").focus();
		return false;
	}
	
});


</script>	
</body>
</html>