<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>멤버 목록</h3>
	<a href="insertform.do">멤버추가</a>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<MemberDto> list = (List<MemberDto>) request.getAttribute("list");
				
				for (MemberDto tmp : list) {
			%>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getName()%></td>
				<td><%=tmp.getAddr()%></td>
				<td><a href="javascript:memberDelete(<%=tmp.getNum()%>)">삭제</a></td>
				<td><a href="updateform.do?num=<%=tmp.getNum()%>">수정</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<script>
	function memberDelete(num){
		var isDelete=confirm("삭제하시겠습니까?");
		if(isDelete){
			
			location.href="delete.do?num="+num;		
		}else{
			location.href="/list.do";
		}
	}
	</script>
</body>
</html>