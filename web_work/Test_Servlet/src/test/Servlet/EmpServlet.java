package test.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.EmpDao;
import test.dto.EmpDto;

@WebServlet("/emp/list")
public class EmpServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<EmpDto> li =EmpDao.getInstance().getList();
		
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
		pw.println("<title>회사 직원 명부</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>사원 추가하기</h3>");		
		pw.println("<form action='insert' method='post'>");
		pw.println("<label for='name'>empno</label>");
		pw.println("<input type='text' name='empno' val=''/>");
		pw.println("<label for='name'>ename</label>");
		pw.println("<input type='text' name='ename' val=''/>");
		pw.println("<label for='name'>job</label>");
		pw.println("<input type='text' name='job' val=''/>");
		pw.println("<label for='name'>mgr</label>");
		pw.println("<input type='text' name='mgr' val=''/>");
		pw.println("<label for='name'>hiredate</label>");
		pw.println("<input type='text' name='hiredate' val=''/>");
		pw.println("<label for='name'>sal</label>");
		pw.println("<input type='text' name='sal' val=''/>");
		pw.println("<label for='name'>comm</label>");
		pw.println("<input type='text' name='comm' val=''/>");
		pw.println("<label for='name'>deptno</label>");
		pw.println("<input type='text' name='deptno' val=''/>");
		pw.println("<button type='submit'>추가</button>");
		pw.println("<button type='reset'>취소</button>");
		pw.println("</form>");
		pw.println("<h3>회사 직원 명부</h3>");
		pw.println("<table>");
		pw.println("<thead>");
		pw.println("<tr>");
		pw.println("<th>empno</th>");
		pw.println("<th>ename</th>");
		pw.println("<th>job</th>");
		pw.println("<th>manager</th>");
		pw.println("<th>hiredate</th>");
		pw.println("<th>sal</th>");
		pw.println("<th>comm</th>");
		pw.println("<th>deptno</th>");
		pw.println("<th>dname</th>");
		pw.println("<th>loc</th>");
		pw.println("<th>삭제</th>");
		pw.println("</tr>");
		pw.println("</thead>");
		pw.println("<tbody>");
		for(EmpDto tmp:li) {
			
			pw.println("<tr>");
			pw.println("<td>"+tmp.getEmpno()+"</td>");
			pw.println("<td>"+tmp.getEname()+"</td>");
			pw.println("<td>"+tmp.getJob()+"</td>");
			pw.println("<td>"+tmp.getMgr()+"</td>");
			pw.println("<td>"+tmp.getHiredate()+"</td>");
			pw.println("<td>"+tmp.getSal()+"</td>");
			pw.println("<td>"+tmp.getComm()+"</td>");
			pw.println("<td>"+tmp.getDeptno()+"</td>");
			pw.println("<td>"+tmp.getDname()+"</td>");
			pw.println("<td>"+tmp.getLoc()+"</td>");
			pw.println("<td><a href ='delete?empno="+tmp.getEmpno()+"'>삭제</a></td>");
			pw.println("<td><a href='updateform?empno="+tmp.getEmpno()+"'>수정</a></td>");
			pw.println("</tr>");
			
		}
		pw.println("</tbody>");
		pw.println("</table>");
		pw.println("</body>");
		pw.println("</html>");
	}
}
