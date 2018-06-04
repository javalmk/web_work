<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/go7.jsp</title>
<!-- 상대 경로를 이용해서 jquery 로딩 -->
<script src="../js/jquery-3.2.1.js"></script>
</head>
<body>
<h3> <strong id="sec">5</strong>초 후에 /test/result7.jsp 페이지로 이동합니다.</h3>
<script>

	var count=5;
	
	setInterval(function(){
		count--; //카운트 1씩 감소 시키기
		$("#sec").text(count);//카운트 출력
		if(count==0){//카운트가 0 이 되면 이동!
			location.href="result7.jsp";
		}
	}, 1000);

</script>
</body>
</html>








