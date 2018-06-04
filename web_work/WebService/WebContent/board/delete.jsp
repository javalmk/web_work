<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
//1.삭제할 파일의 저장된 파일명을 읽어온다.
FileDto dto = FileDao.getInstance().getData(num);
String saveFileName = dto.getSaveFilename();
//파일 db 삭제
FileDao.getInstance().delete(num);
//3. 파일 시스템에서 삭제한다.
//삭제할 파일의 절대 경로 구성하기
String path = application.getRealPath("/upload") + File.separator + saveFileName;
//파일 객체 생성해서 삭제하기
new File(path).delete();

//게시글 삭제
BoardDao.getInstance().delete(num);


%>
<script>
location.href="${pageContext.request.contextPath}/index.jsp";
</script>
</body>
</html>