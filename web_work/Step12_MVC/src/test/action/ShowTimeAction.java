package test.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

/*
 *   /showtime  요청을 처리할 액션 
 */
public class ShowTimeAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
				HttpServletResponse response) {
		// 현재 시간을 얻어오는 비즈니스 로직 수행
		String time=new Date().toString();
		// 데이터(Model) 을 request 에 담는다.
		request.setAttribute("time", time);
		// view 페이지로 forward 이동할수 있도록 ActionForward 객체를 생성해서
		ActionForward af=new ActionForward("/views/showtime.jsp");
		//ActionForward 객체를 리턴해준다. 
		return af;
	}

}







