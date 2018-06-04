package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

public class MemberInsertAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		MemberDto dto = new MemberDto();
		dto.setName(name);
		dto.setAddr(addr);
		MemberDao.getInstance().insert(dto);
		//응답 메세지를 request에 담기
		request.setAttribute("msg", "회원 정보를 추가 했습니다.");
		//확인을 눌렀을때 이동할 url을 request에 담기
		request.setAttribute("url", "/member/list.do");
		//알림 페이지 view로 forward이동할 수 있도록
		ActionForward af = new ActionForward("/views/member/alert.jsp");
		return af;
	}

}
