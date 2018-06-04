package test.controller;

import test.user.action.DeleteAction;
import test.user.action.HomeAction;
import test.user.action.InfoAction;
import test.user.action.LoginAction;
import test.user.action.LoginFormAction;
import test.user.action.LogoutAction;
import test.user.action.SignupAction;
import test.user.action.SignupFormAction;
import test.user.action.UpdateAction;
import test.user.action.UpdateFormAction;

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
			action= new HomeAction();
		}else if(command.equals("/users/signup_form")) {
			action = new SignupFormAction();
		}else if(command.equals("/users/signup")) {
			action = new SignupAction();
		}else if(command.equals("/users/login_form")) {
			action = new LoginFormAction();
		}else if(command.equals("/users/login")) {
			action = new LoginAction();
		}else if(command.equals("/users/logout")) {
			action = new LogoutAction();
		}else if(command.equals("/users/private/info")) {
			action = new InfoAction();
		}else if(command.equals("/users/private/update_form")) {
			action = new UpdateFormAction();
		}else if(command.equals("/users/private/update")) {
			action = new UpdateAction();
		}else if(command.equals("/users/private/delete")) {
			action = new DeleteAction();
			
		}
		return action;
	}
}












