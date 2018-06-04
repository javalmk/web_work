package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class FriendListAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<String> list = new ArrayList<String>();
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		request.setAttribute("list", list);
		return new ActionForward("/views/friends.jsp");
	}

}
