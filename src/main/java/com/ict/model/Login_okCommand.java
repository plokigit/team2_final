package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.DAO;

public class Login_okCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
		BVO vo = new BVO();
		vo.setWriter(id);
		vo.setPwd(pwd);
		List<BVO> bvo = DAO.getLogIn(vo);
		
		request.setAttribute("bvo", bvo);
		request.getSession().setAttribute("bvo", bvo);
		
		for (BVO bvo2 : bvo) {
			if(bvo!=null) {
				request.getSession().setAttribute("id", bvo2.getWriter());
				request.getSession().setAttribute("pw", bvo2.getPwd());
				return "MyController?cmd=list&cPage=1";
			}
		}
		
		request.setAttribute("fail", "아이디 혹은 비밀번호가 틀렸거나 회원이 아닙니다.");
		return "MyController?cmd=login";
	}
}
