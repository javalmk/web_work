<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login.jsp</title>
</head>
<body>
<%
	//폼전송 파라미터를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//아이디 저장 checkbox 를 체크 했으면 null 이 아니다. 
	String isSave=request.getParameter("isSave");
	
	if(isSave != null){// null 이 아니면 쿠키를 응답해서 id 가 저장되도록
		//쿠키 객체를 생성 
		Cookie cookie=new Cookie("savedId", id);
		//최대 유지시간 초단위로 설정
		cookie.setMaxAge(60);
		//쿠키 응답 하기 
		response.addCookie(cookie);
	}
%>
<p> <%=id %> 님 로그인 되었습니다.</p>
<a href="login_form.jsp">로그인 폼으로 돌아가기</a>
</body>
</html>












