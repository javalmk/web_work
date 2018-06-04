package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

@WebServlet("/member/showdata")
public class ShowDataServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//GET 방식 전송 파라미터 추출
		int num=Integer.parseInt(request.getParameter("num"));
		//DB 에서 해당 회원의 정보를 읽어온다.
		MemberDto dto=new MemberDto(1, "김구라", "노량진");
		//request 영역에 담는다.
		request.setAttribute("dto", dto);
		//forward 방식으로 이동한다. (jsp 페이지로 응답을 위임)
		RequestDispatcher rd=
				request.getRequestDispatcher("/member/showdata.jsp");
		rd.forward(request, response);
	}	
}































