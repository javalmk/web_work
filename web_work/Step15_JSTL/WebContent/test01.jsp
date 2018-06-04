<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 라이브러리 사용할 준비  taglib 하고 스페이스 다음 컨트롤 스페이스 큰따옴표 안에서 한번더 컨트롤스페이스 접두어를 c로 하겠다.-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jstl 반복문</h3>
<c:forEach var="i" begin="0" end="9" step="1">
<strong>${i }</strong>
</c:forEach>
<h3> java code 반복문</h3>
<%for (int i=0; i<10; i++){ %>
<strong><%=i %></strong>
<%} %>
</body>
</html>