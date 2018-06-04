<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>OutStargram</title>

<jsp:include page="/resources/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<%

//쿠키에 저장된 아이디를 담을 변수
String savedId="";
String savedPwd="";

//reques 객체에 담겨서 전달된 쿠키 목록을 읽어온다.
Cookie[] cookies=request.getCookies();

if(cookies != null && cookies.length > 0){
	for(Cookie tmp:cookies){
		if(tmp.getName().equals("rememberid")){
			//쿠키 value 를 읽어와서 변수에 담는다.
			savedId=tmp.getValue();
		}
		if(tmp.getName().equals("remeberpwd")){
			savedPwd=tmp.getValue();
		}
	}
}
%>
	<div class="container">
		<div>

			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form" method="POST" action="login.jsp"
							class="sign-in-form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="id" id="id" name="id"
										type="text" value="<%=savedId %>" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" id="pwd" placeholder="Password"
										name="pwd" type="password" value="<%=savedId %>">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="remember">remember me
									</label>
								</div>

								<button type="submit" class="btn btn-default">로그인</button>
							</fieldset>
						</form>
					</div>
				</div>
				<div>
					
						<div class="col-xs-4"><a href="<%=application.getContextPath()%>/users/signup_form.jsp">회원가입</a></div>
						<div class="col-xs-4"><a href="javascript:findId()">아이디찾기</a></div>
						<div class="col-xs-4"><a href="javascript:findPwd()">비밀번호찾기</a></div>
					
				</div>
			</div>


		</div>

	</div>
<script>
//아이디 찾기 팝업창
function findId(){
	window.open("findId_form.jsp", "팝업창", "width=300, height=200, left=300, top=100");
}
//비번 찾기 팝업창
function findPwd(){
	
	window.open("findPwd_form.jsp", "팝업창", "width=300, height=200, left=300, top=100");
}
</script>
</body>
</html>

