<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원정보 입니다.</h3>
<table>
<thead>
<tr>
<th>번호</th><th>이름</th><th>주소</th>
</tr>
</thead>
<tbody>
<tr>
<td>${dto.num }</td><td>${dto.name }</td><td>${dto.addr }</td>
</tr>
</tbody>
</table>
</body>
</html>