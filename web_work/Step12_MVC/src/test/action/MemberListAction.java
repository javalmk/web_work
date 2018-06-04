package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class MemberListAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
					HttpServletResponse response) {
		//1. 회원 목록을 얻어오는 비즈니스 로직을 수행
		List<String> list=new ArrayList<>();
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		//2. 데이터 (Model) 을 request 에 담고
		request.setAttribute("list", list);
		//3. view 페이지로 forward 이동할수 있도록 ActionForward 객체 생성해서
		ActionForward af=new ActionForward("/views/member/list.jsp");
		
		//리턴해 준다. 
		return af;
	}

}








