package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;

public class LogoutAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1.세션 초기화
		HttpSession session = request.getSession();
		session.removeAttribute("id");//id만 지움
//		session.invalidate();모든 세션 지움
//		2. 응답
		
		return new ActionForward("/views/users/logout_result.jsp");
	}

}
