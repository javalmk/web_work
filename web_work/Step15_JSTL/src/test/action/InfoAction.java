package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.controller.Action;
import test.controller.ActionForward;
import test.member.dto.MemberDto;

public class InfoAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//멤버정보 불러온다.
		MemberDto dto = new MemberDto(1,"김구라","노량진");
		//request에 담는다
		request.setAttribute("dto", dto);
		//forward 통해서 회원정보 출력
		return new ActionForward("/views/info.jsp");
	}

}
