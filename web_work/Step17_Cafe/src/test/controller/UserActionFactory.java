package test.controller;

import test.action.HomeAction;
import test.cafe.action.CafeCommentInsertAction;
import test.cafe.action.CafeDeleteAction;
import test.cafe.action.CafeDetailAction;
import test.cafe.action.CafeInsertAction;
import test.cafe.action.CafeInsertFormAction;
import test.cafe.action.CafeListAction;
import test.cafe.action.CafeUpdateAction;
import test.cafe.action.CafeUpdateFormAction;
import test.users.action.LoginAction;
import test.users.action.LoginFormAction;
import test.users.action.LogoutAction;
import test.users.action.SignupAction;
import test.users.action.SignupFormAction;
import test.users.action.UsersDeleteAction;
import test.users.action.UsersInfoAction;
import test.users.action.UsersUpdateAction;
import test.users.action.UsersUpdateFormAction;

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
		}else if(command.equals("/users/signup_form")) {
			action=new SignupFormAction();
		}else if(command.equals("/users/signup")) {
			action=new SignupAction();
		}else if(command.equals("/users/login_form")) {
			action=new LoginFormAction();
		}else if(command.equals("/users/login")) {
			action=new LoginAction();
		}else if(command.equals("/users/logout")) {
			action=new LogoutAction();
		}else if(command.equals("/users/private/info")) {
			action=new UsersInfoAction();
		}else if(command.equals("/users/private/updateform")) {
			action=new UsersUpdateFormAction();
		}else if(command.equals("/users/private/update")) {
			action=new UsersUpdateAction();
		}else if(command.equals("/users/private/delete")) {
			action=new UsersDeleteAction();
		}else if(command.equals("/cafe/list")) {
			action=new CafeListAction();
		}else if(command.equals("/cafe/private/insertform")) {
			action=new CafeInsertFormAction();
		}else if(command.equals("/cafe/private/insert")) {
			action=new CafeInsertAction();
		}else if(command.equals("/cafe/detail")) {
			action=new CafeDetailAction();
		}else if(command.equals("/cafe/private/delete")) {
			action=new CafeDeleteAction();
		}else if(command.equals("/cafe/private/updateform")) {
			action=new CafeUpdateFormAction();
		}else if(command.equals("/cafe/private/update")) {
			action=new CafeUpdateAction();
		}else if(command.equals("/cafe/comment_insert")) {
			action=new CafeCommentInsertAction();
		}
		return action;
	}
}












