
<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insert.jsp</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");

	//폼 전송되는 내용을 추출해서
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//MemberDto 에 담아서
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	//MemberDao 객체를 이용해서 저장한다.
	MemberDao.getInstance().insert(dto);
%>
<p> 회원정보를 추가 했습니다. </p>
<a href="list.jsp">목록보기</a>
</body>
</html>














