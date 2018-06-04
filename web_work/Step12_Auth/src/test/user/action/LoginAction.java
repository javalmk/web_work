package test.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class LoginAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		boolean isValid=UsersDao.getInstance().isValid(new UsersDto(id, pwd, null, 0, null));
		System.out.println(isValid);
		ActionForward af=null;
		if(isValid) {
			request.setAttribute("id", id);
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
			af = new ActionForward("/home.do");
			af.setRedirect(true);
			
		}else if(!isValid){
			request.setAttribute("msg","아이디 혹은 비밀번호가 올바르지 않습니다.");
			af = new ActionForward("/users/login_form.do");			
		}
		return af;
		
	}

}
