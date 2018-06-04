package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class HomeAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	List<String> news=new ArrayList<>();
	news.add("오늘 날씨가 춥네요");
	news.add("감기 조심하세요");
	news.add("MVC partern 공부중");
	news.add("어쩌구...저쩌구...");
	request.setAttribute("news", news);
	ActionForward af = new ActionForward("/views/home.jsp");
	return af;
	}

}
