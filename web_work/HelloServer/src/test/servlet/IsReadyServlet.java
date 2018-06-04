package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/isReady")
public class IsReadyServlet extends HttpServlet {
	// 멤버필드
	private int count;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 방문횟수 증가 시키기
		count++;
		// 클라이언트에게 출력할수 있는 객체의 참조값 얻어오기
		PrintWriter pw = res.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>Index.html</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>okay!</h3>");
		pw.println("count:" + count);
		pw.println("</body>");
		pw.println("</html>");

	}
}
