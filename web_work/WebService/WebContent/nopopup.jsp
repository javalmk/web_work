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
//chk라는 파라미터 명으로 넘어오는 값이 있는지 확인
String chk=request.getParameter("chk");
System.out.println(chk);
//팝업 체크 박스를 체크하고 팝업창을 닫았다면(value="no") 값이 넘어옴
if(chk!=null){
	Cookie cookie = new Cookie("popup",chk);
	cookie.setMaxAge(60*20);
	response.addCookie(cookie);
}
%>
<script>
//쿠키 응답후 팝업창 자동 닫기
self.close();
</script>



</body>
</html>