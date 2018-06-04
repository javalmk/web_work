<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/* 
	JSP 기본 객체
	1. PageContext
	2. HttpServletRequest(자주씀)--응답전까지 쓸수있다.
	3. HttpSession(자주씀)--세션이 유지 되는 동안 쓸수있다. 페이지 이동되도 사용 가능(웹브라우저 종료전 또는 임의로 세션을 지우기 전까지)
	4. ApplicationContext--서버를 껐다가 켤때까지 씀
	
	위의 객체들은 모두 .setAttribute(key,value)
				.getAttribute(key)			를 가진다.
	*/ 
	
	
		//	page 영역에  "myName" 이라는 키값으로 String type 저장하기
		pageContext.setAttribute("myName", "김구라");
	//request 영역에 "yourName" 이라는 키값으로 String type 저장
	request.setAttribute("yourName", "원숭이");
	
	//session 영역에 "id"이라는 키값으로 String type 저장
	session.setAttribute("id", "kimgura");
	
	//application 영역에 "count"라는 키값으로 String type 저장
	application.setAttribute("count",999);
		
	%>
	<p> PageContext 객체에 저장된 문자열:<strong>${pageScope.myName }</strong></p>
	<p> PageContext 객체에 저장된 문자열:<strong>${myName }</strong></p>
	
	<p> HttpServletRequest 객체에 저장된 문자열:<strong>${requestScope.yourName }</strong></p>
	<p> HttpServletRequest 객체에 저장된 문자열:<strong>${yourName }</strong></p>
	
	<p> HttpSession 객체에 저장된 문자열:<strong>${sessionScope.id }</strong></p>
	<p> HttpSession 객체에 저장된 문자열:<strong>${id }</strong></p>
	
	<p> ApplicationContext 객체에 저장된 문자열:<strong>${applicationScope.count }</strong></p>
	<p> ApplicationContext 객체에 저장된 문자열:<strong>${count }</strong></p>
	
</body>
</html>