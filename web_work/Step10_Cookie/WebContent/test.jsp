<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 문자열 읽어오기
	String msg=request.getParameter("msg");
	
	if(msg != null){
		//쿠키 객체를 생성해서 new Cookie(key, value)
		Cookie cookie=new Cookie("savedMsg", msg);
		//쿠키 유지시간을 초단위로 지정한다.
		cookie.setMaxAge(60);
		//응답할때 쿠키가 같이 응답되도록 요청 객체에 담는다. 
		response.addCookie(cookie);	
	}
%>
<h3>쿠키 테스트</h3>
<form action="test.jsp" method="post">
	<label for="msg">쿠키로 저장할 문자열 입력</label>
	<input type="text" name="msg" id="msg"/>
	<button type="submit">저장</button>
</form>
<a href="result.jsp">저장된 쿠키 확인하기</a>
</body>
</html>










