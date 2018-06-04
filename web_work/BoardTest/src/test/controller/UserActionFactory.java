package test.controller;

import test.action.HomeAction;
import test.cafe.action.CafeListAction;
public class UserActionFactory {
	private static UserActionFactory factory;
	private UserActionFactory(){}
	//자신의 참조값을 리턴해주는 메소드
	public static UserActionFactory getInstance(){
		if(factory==null){
			factory=new UserActionFactory();
		}
		return factory;
	}
	// 요청처리를 할 Action 객체를 리턴해주는 메소드
	public Action action(String command) {
		Action action=null;
		if(command.equals("/home")) {
			action=new HomeAction();
		}else if(command.equals("/cafe/list")) {
			action=new CafeListAction();
		}
		return action;
	}
}












