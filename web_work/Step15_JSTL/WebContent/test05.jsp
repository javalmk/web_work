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
<%
request.setAttribute("jumsu", 75);
%>
<h3>다중 taglib 를 구성해 보기</h3>
<c:choose>
<c:when test="${jumso ge 90 }">
<p>점수는 ${jumsu } 이고 성적은 A입니다.</p>
</c:when>
<c:when test="${jumso ge 80 }">
<p>점수는 ${jumsu } 이고 성적은 B입니다.</p>
</c:when>
<c:when test="${jumso ge 70 }">
<p>점수는 ${jumsu } 이고 성적은 C입니다.</p>
</c:when>
<c:when test="${jumso ge 60 }">
<p>점수는 ${jumsu } 이고 성적은 D입니다.</p>
</c:when>

<c:otherwise>
<p>점수는 ${jumsu } 이고 성적은 F입니다.</p>

</c:otherwise>
</c:choose>

</body>
</html>