package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/go9")
public class Go9Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("/test/go9 요청 처리중...");
		
		// view2.jsp 페이지에 전달할 데이터라고 가정 
		String name="김구라";
		
		//request 객체에 String type 담기
		request.setAttribute("myName", name);
		
		//요청 전달자 객체 얻어오기
		RequestDispatcher rd=
				request.getRequestDispatcher("view2.jsp");
		//view1.jsp 페이지(서블릿) 에 응답을 위임한다.
		rd.forward(request, response);
	}
}













