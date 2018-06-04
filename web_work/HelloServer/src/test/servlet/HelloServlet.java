package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//	hello요청이 됐을때 응답할수 있도록 설정(@web 컨트롤 스페이스)
@WebServlet("/hello")
						//상속받음으로써 클라이언트에게 응답할수 있다.
public class HelloServlet extends HttpServlet{
//	부모의 메소드 오버라이드 (service 컨트롤 스페이스)
	@Override
	protected void service(HttpServletRequest reqest,
			HttpServletResponse response) throws ServletException, IOException {
//		클라이언트에게 출력하기 위한 객체
		PrintWriter pw=response.getWriter();
//		world라는 문자열 출력하기
		pw.println("world");
		
	}
}
