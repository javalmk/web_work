<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("/test/go5.jsp 요청 처리중...");
	
	// jsp 기본객체 response 를 이용해서 리다일렉트 이동 시키기 
	response.sendRedirect("result5.jsp");
%>
