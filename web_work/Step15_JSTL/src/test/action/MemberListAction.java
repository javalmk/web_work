package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dto.MemberDto;

public class MemberListAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDto dto1= new MemberDto(1, "김구라", "상도동");
		MemberDto dto2= new MemberDto(2, "원숭이", "동물원");
		MemberDto dto3= new MemberDto(3, "해골", "노량진");
		
		List<MemberDto> list = new ArrayList<>();
		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		request.setAttribute("list", list);
		return new ActionForward("/views/members.jsp");
	}

}
