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

@WebServlet("/emp/updateform")
public class EmpUpdateServletForm extends HttpServlet {
	@Override
	protected void service(HttpServletRequest reqeust, HttpServletResponse response)
			throws ServletException, IOException {
		// 응답 인코딩 설정
		response.setCharacterEncoding("utf-8");

		// 응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");
		// 수정할 회원의 정보를 읽어온다.
		int empno = Integer.parseInt(reqeust.getParameter("empno"));
		// EmpDao 객체를 이용해서 해당 번호의 회원정보를 얻어온다.
		EmpDto dto = EmpDao.getInstance().getData(empno);

		// 클라이언트에게 문자열을 출력할수 있는 객체 얻어오기
		PrintWriter pw = response.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>회원정보 수정창</h3>");
		pw.println("<form action='update' method='post'>");
//		pw.println("<label for='name'>empno</label>");
		pw.println("<input type='hidden' name='empno' val='"+dto.getEmpno()+"'/>");
		pw.println("<label for='name'>ename</label>");
		pw.println("<input type='text' name='ename' val='"+dto.getEname()+"'/>");
		pw.println("<label for='name'>job</label>");
		pw.println("<input type='text' name='job' val='"+dto.getJob()+"'/>");
//		pw.println("<label for='name'>mgr</label>");
//		pw.println("<input type='hidden' name='mgr' val='asd'/>");
//		pw.println("<label for='name'>hiredate</label>");
//		pw.println("<input type='hidden' name='hiredate' val='"+null+"'/>");
		pw.println("<label for='name'>sal</label>");
		pw.println("<input type='text' name='sal' val='"+dto.getSal()+"'/>");
		pw.println("<label for='name'>comm</label>");
		pw.println("<input type='text' name='comm' val='"+dto.getComm()+"'/>");
		pw.println("<label for='name'>deptno</label>");
		pw.println("<input type='text' name='deptno' val='"+dto.getDeptno()+"'/>");
		pw.println("<button type='submit'>수정</button>");
		pw.println("<button type='reset'>취소</button>");
		pw.println("</form>");
		pw.println("</body>");
		pw.println("</html>");
	}
}
