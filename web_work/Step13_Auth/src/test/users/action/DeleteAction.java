package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;

public class DeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id =(String)session.getAttribute("id");
		UsersDao.getInstance().delete(id);
		session.removeAttribute("id");
		ActionForward af = new ActionForward("/home.do");
		af.setRedirect(true);
		return af;
	}

}
