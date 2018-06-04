package test.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class SignupAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		int phone=Integer.parseInt(request.getParameter("phone"));
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		dto.setPhone(phone);
		UsersDao.getInstance().insert(dto);
		HttpSession session=request.getSession();
		session.setAttribute("id", id);
		ActionForward af = new ActionForward("/home.do");
		return af;
	}

}
