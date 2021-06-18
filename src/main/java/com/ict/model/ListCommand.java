package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.BVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		Paging pvo = new Paging();

		int conut = DAO.getCount(); // 전체 게시물의 수
		pvo.setTotalRecord(conut);

		pvo.setTotalPage(pvo.getTotalRecord() / pvo.getNumPerPage()); // 전체 페이지 수

		if (pvo.getTotalRecord() / pvo.getNumPerPage() != 0) { // 나머지가 있으면 페이지+1
			pvo.setTotalPage(pvo.getTotalPage() + 1);
		}

		String cPage = request.getParameter("cPage"); // 현재 페이지 위치, listCommand에 cPage를 반드시 넣어야 함
		if(cPage==null) {
			cPage = "1";
		}
		pvo.setNowPage(Integer.parseInt(cPage));

		pvo.setBegin((pvo.getNowPage() - 1) * pvo.getNumPerPage() + 1); // 페이지 안의 게시글 시작 번호 구하기
		pvo.setEnd((pvo.getBegin() - 1) + pvo.getNumPerPage()); // 페이지 안의 게시글 끝 번호 구하기
		List<BVO> list = DAO.getList(pvo.getBegin(), pvo.getEnd());
		
		pvo.setBeginBlock((int)(pvo.getNowPage()-1)/pvo.getPagePerBlock()*pvo.getPagePerBlock()+1); // 블록의 시작 페이지 구하기
		pvo.setEndBlock(pvo.getBeginBlock()+pvo.getPagePerBlock()-1);
		
//		endBlock이 totalPage보다 클 수 있음
		if (pvo.getEndBlock() > pvo.getTotalPage()) {
			pvo.setEndBlock(pvo.getTotalPage());
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);

		return "view/list.jsp";
	}

}
