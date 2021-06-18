package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.BVO;

public class Join_okCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		BVO bvo = new BVO();
		bvo.setWriter(request.getParameter("writer"));
		bvo.setPwd(request.getParameter("pwd"));
		bvo.setHit("0");
		bvo.setSubject("회원 가입을 축하합니다.");

		List<BVO> vo = DAO.getLogIn(bvo);

		for (BVO vo2 : vo) {
			if (vo2 != null) {
				request.setAttribute("fail", "이미 회원입니다. 로그인 페이지로 이동합니다.");
				return "MyController?cmd=login";
			}
		}
		
		int result = DAO.getJoin(bvo);
		request.setAttribute("fail", "회원가입에 성공 했습니다. 로그인 페이지로 이동합니다.");
		if (result > 0) {
			return "MyController?cmd=login";
		}
		
		return null;
	}

}
