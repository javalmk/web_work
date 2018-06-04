<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jstl의 if문</h3>
<c:if test="true">
<p>출력됨1</p>
</c:if>
<c:if test="false">
<p>출력됨2</p>
</c:if>
<c:if test="${10 gt 2}">
<p>출력됨3</p>
</c:if>
</body>
</html>