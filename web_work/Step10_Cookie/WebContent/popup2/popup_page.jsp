<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/popup2/popup_page.jsp</title>
<style>
	body{ background-color: yellow;}
</style>
</head>
<body>
<h3>불금 파격 할인</h3>
<p>아디다스 슬리퍼 3000원</p>
<p>나이키 수영복 29800원</p>
<form action="nopopup.jsp" method="post" name="myForm">
	<label>
		<input type="checkbox" name="chk" value="no" />
		1 분동안 팝업 띄우지 않기
	</label>
	<a href="javascript:closePopup()">닫기</a>
</form>
<script>
	function closePopup(){
		// 폼 강제 전송
		document.myForm.submit();
	}
</script>
</body>
</html>