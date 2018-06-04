package test.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.EmpDao;
import test.dto.EmpDto;
@WebServlet("/emp/update")
public class EmpUpdateServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답 인코딩 설정
		response.setCharacterEncoding("utf-8");

		//응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");
		
		// 응답 컨텐츠 설정
				int empno=Integer.parseInt(request.getParameter("empno"));
				String ename= request.getParameter("ename");
				String job= request.getParameter("job");
				
				
				int sal=Integer.parseInt(request.getParameter("sal"));
				int comm=Integer.parseInt(request.getParameter("comm"));
				int deptno=Integer.parseInt(request.getParameter("deptno"));
				EmpDao.getInstance().update(new EmpDto(empno, ename, job, null, null, sal, comm, deptno));
				
		//클라이언트에게 문자열을 출력할수 있는 객체 얻어오기
		PrintWriter pw = response.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("");
		pw.println("</body>");
		pw.println("</html>");
		
	}
}
