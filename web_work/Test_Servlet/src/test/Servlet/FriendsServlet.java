package test.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.FriendsDao;
import test.dto.FriendsDto;

@WebServlet("/friends/list")
public class FriendsServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<FriendsDto> li = FriendsDao.getInstance().getList();
		// 응답 인코딩 설정
		response.setCharacterEncoding("utf-8");

		// 응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");
		// 클라이언트에게 문자열을 출력할수 있는 객체 얻어오기
		PrintWriter pw = response.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<title>친구들 전화번호</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>친구들 전화번호</h3>");		
		pw.println("<table>");
		pw.println("<thead>");
		pw.println("<tr>");
		pw.println("<th>번호</th>");
		pw.println("<th>이름</th>");
		pw.println("<th>전화번호</th>");
		pw.println("</tr>");
		pw.println("</thead>");
		pw.println("<tbody>");
		for(FriendsDto tmp:li) {
			pw.println("<tr>");
			pw.println("<td>"+tmp.getNum()+"</td>");
			pw.println("<td>"+tmp.getName()+"</td>");
			pw.println("<td>"+tmp.getPhone()+"</td>");
			pw.println("</tr>");			
		}
		pw.println("</tbody>");		
		pw.println("</table>");
		pw.println("</body>");
		pw.println("</html>");
	}
}
