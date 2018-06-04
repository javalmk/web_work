package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test2")
public class TestServlet2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//전송되는 num, name 을 추출해서 콘솔에 출력하고
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		System.out.println("num:"+num);
		System.out.println("name:"+name);
		//클라이언트에게는 ok~ 문자열을 출력해 보세요.
		PrintWriter pw=response.getWriter();
		pw.println("ok~");
	}
}











