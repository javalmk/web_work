package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class CafeListAction extends Action{
	private static final int PAGE_ROW_COUNT=20;
	private static final int PAGE_DISPLAY_COUNT=5;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		return new ActionForward("/views/cafe/list.jsp");
	}

}
