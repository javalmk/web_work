<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고</title>
</head>
<body>
	<h3>팝업 광고창!</h3>
	<form action="nopopup.jsp" method="post" name="myForm">
		<label> <input type="checkbox" name="chk" value="no" /> 20분동안
			팝업띄우지 않기
		</label>
		<!-- 버튼은 어울리지 않으니까 anchor로~ -->
		<a href="javascript:closePopup()">닫기</a>
	</form>
	<script>
		//폼강제전송하는 메소드
		function closePopup() {
			document.myForm.submit();
		}
	</script>
</body>
</html>