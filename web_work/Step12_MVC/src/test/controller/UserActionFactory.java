package test.controller;

import test.action.FortuneAction;
import test.action.MemberDetailAction;
import test.action.MemberListAction;
import test.action.PersonAction;
import test.action.ShowTimeAction;

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
		//만일 /fortune.do 요청이라면 
		if(command.equals("/fortune")) {
			action=new FortuneAction();
		}else if(command.equals("/showtime")) {
			action=new ShowTimeAction();
		}else if(command.equals("/person")) {
			action=new PersonAction();
		}else if(command.equals("/member/detail")) {
			action=new MemberDetailAction();
		}else if(command.equals("/member/list")) {
			action=new MemberListAction();
		}
		return action;
	}
}












