package test.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UpdateAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		int phone=Integer.parseInt(request.getParameter("phone"));
		boolean isSuccess=UsersDao.getInstance().update(new UsersDto(id, pwd, email, phone, null));
		if(isSuccess) {
			ActionForward af = new ActionForward("/users/private/info.do");
			return af;
		}else {
			ActionForward af = new ActionForward("/users/private/update_form.do");
			af.setRedirect(true);
			return af;
		}
	}

}
