package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dto.MemberDto;

public class MemberDetailAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) {
		//1. 회원 한명의 정보를 얻어오는 비즈니스 로직 수행
		MemberDto dto=new MemberDto(1, "김구라", "노량진");
		//2. 데이터(Model) 을 request 에 담는다.
		request.setAttribute("dto", dto);
		//3. view 페이지로 forward 이동할수 있도록 ActionForward 객체를 생성해서
		ActionForward af=new ActionForward("/views/member/detail.jsp");
		//리턴해 준다.
		return af;
	}

}












