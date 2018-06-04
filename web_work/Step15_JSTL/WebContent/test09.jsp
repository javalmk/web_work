<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setAttribute("price", "1000000");
request.setAttribute("weight", "95.1234");
%>
<p>가격 : <strong>1,000,000</strong></p>
<p>가격 : <strong>${price}</strong></p>
<p>가격 : <strong><fmt:formatNumber value="${price}"/></strong></p>
<p>가격 : <strong><fmt:formatNumber value="${price}" type="currency"/></strong></p>
<p>가격 : <strong><fmt:formatNumber value="${price}" type="currency" currencySymbol="$"/></strong></p>
<p>몸무게 : <strong><fmt:formatNumber pattern=".00" value="${weight}"/>
</strong></p>
</body>
</html>