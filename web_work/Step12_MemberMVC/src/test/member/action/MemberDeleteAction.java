package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

public class MemberDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 삭제할 회원의 번호를 얻어와서
		int num = Integer.parseInt(request.getParameter("num"));
		//2. db에서 삭제하고
		MemberDao.getInstance().delete(num);
		//3. 응답(리다이렉트 경로)
		ActionForward af = new ActionForward("/member/list.do");
		af.setRedirect(true);//리다이렉트로 요청하도록 응답
		return af;
	}

}
