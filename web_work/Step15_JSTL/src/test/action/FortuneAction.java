package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
/*
 *  1. 오늘의 운세를 얻어오는 비즈니스 로직을 처리하고 
 *  2. 로직의 처리결과(Model) 데이터를 request 영역에 담고
 *  3. view(jsp) 페이지로 forward 이동해서 응답하는 액션 정의하기
 */
public class FortuneAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//오늘의 운세
		String fortuneToday="동쪽으로 가면 귀인을 만나요~";
		//데이터(Model) 을 request 에 담는다.
		request.setAttribute("fortuneToday", fortuneToday);
		// view 페이지로 forward 이동할수 있도록 ActionForward 객체를 생성해서
		// 리턴해준다.
		return new ActionForward("/views/fortune.jsp");
	}

}







