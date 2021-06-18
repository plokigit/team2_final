package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.BVO;
import com.ict.db.CVO;

public class OnelistCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		request.setAttribute("cPage", cPage);
		
		DAO.getHitUp(b_idx);

		BVO bvo = DAO.getDetail(b_idx);
		request.getSession().setAttribute("bvo", bvo);
		
		List<CVO> c_list = DAO.getClist(b_idx);
		request.setAttribute("c_list", c_list);
		
		return "view/onelist.jsp";
	}

}
