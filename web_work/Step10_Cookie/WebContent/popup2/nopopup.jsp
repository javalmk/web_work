<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nopopup.jsp</title>
</head>
<body>
<%
	String chk=request.getParameter("chk");
	
	//만일 체크 박스를 체크하고 팝업창을 닫았다면
	if( chk != null){
		Cookie cookie=new Cookie("popup", chk);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
	}
%>
<script>
	//쿠키를 응답한 다음 팝업창이 자동으로 닫아 지도록  
	self.close();
</script>
</body>
</html>







