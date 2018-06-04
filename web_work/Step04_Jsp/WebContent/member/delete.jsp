<%@page import="test.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/delete.jsp</title>
</head>
<body>
<%
	//삭제할 회원의 번호를 읽어와서 
	int num=Integer.parseInt(request.getParameter("num"));
    //DB 에서 삭제한다.
    MemberDao.getInstance().delete(num);
%>
<script>
	alert("삭제 했습니다.");
	location.href="list.jsp";
</script>
</body>
</html>












