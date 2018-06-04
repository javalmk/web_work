package test.file.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;

public class FileListAction extends Action {

	// 한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT = 10;
	// 하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT = 5;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");

		
		FileDto dto = new FileDto();
		if(keyword !=null) {//검색키워드 있고
			if(condition.equals("title")) {
				//제목검색인 경우
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				//작성자 검색인경우
				dto.setWriter(keyword);
			}
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
			
		}
		//파라미터로 페이지넘버 안넘어오면 보여줄 페이지 번호는 1
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum!=null) {
			pageNum=Integer.parseInt(strPageNum);
		}
		//만약 2페이지면
		//(2페이지-1)*10줄+1=11
		//11이 startRowNum 이 된다.
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		
		//만약 2페이지면
		//2*10=20
		//20이 endRowNum이 된다.
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row의 갯수를 db에서 얻기
		int totalRow =FileDao.getInstance().getCount(dto);
		
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//시작 페이지 번호
		//1-1  2-2 ...5-5  6-6
		int startPageNum=
				1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝페이지번호
		
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount<endPageNum) {
			endPageNum=totalPageCount;
			
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<FileDto> list = FileDao.getInstance().getList(dto);
		
		request.setAttribute("list", list);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		return new ActionForward("/views/file/list.jsp");
	}

}
