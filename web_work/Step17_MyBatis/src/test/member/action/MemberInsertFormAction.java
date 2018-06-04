package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class MemberInsertFormAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) {
		// 회원추가 폼만 출력해 주면 되기 때문에 수행할 비즈니스 로직은 없다.
		
		//view 페이지의 정보를 담고 
		ActionForward af=new ActionForward("/views/member/insertform.jsp");
		//리턴해 준다.
		return af;
	}
	
}







