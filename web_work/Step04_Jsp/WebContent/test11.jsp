<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test11.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<%
	String strNum=request.getParameter("pageNum");
	int pageNum=0;
	if(strNum==null){//페이지 번호가 넘어오지 않으면
		pageNum=1;
	}else{//페이지 번호가 넘어오면
		//문자열을 숫자로 바꿔서 넣어준다.
		pageNum=Integer.parseInt(strNum);
	}
%>
<div class="container">
	<h3>pagination 연습</h3>
	<ul class="pagination">
	<%for(int i=1; i<11; i++){ %>
		<li <%if(pageNum==i){%>class="active"<%}%>><a href="test11.jsp?pageNum=<%=i%>"><%=i %></a></li>
	<%} %>
	</ul>
</div>
</body>
</html>








