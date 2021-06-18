package com.ict.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.BVO;

public class Delete_okCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		try {
//			댓글이 없어야 게시물 삭제 가능, 외래키로 연결돼 있기 때문
//			방법1> try~catch로 error.jsp로 이동
//			방법2> 원글 안의 댓글을 먼저 전부 삭제
//			방법3> 원글 컬럼을 늘려서 삭제된 글로 표시
			
			BVO bvo = (BVO) request.getSession().getAttribute("bvo");
			
//			방법2> 원글 안의 댓글을 먼저 전부 삭제
			DAO.getComment_delete_all(bvo.getB_idx());
			
			
//			원글 삭제
			int result = DAO.getDelete(bvo);
			if (result > 0) {
				String path = request.getServletContext().getRealPath("/upload");
				String file_name = bvo.getFile_name();
				if (bvo.getFile_name() != null) {
					File file = new File(path + "/" + new String(file_name.getBytes("utf-8")));
					if (file.exists()) {
						file.delete();
					}
				}
				String cPage = request.getParameter("cPage");
				return "MyController?cmd=list&cPage="+cPage;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
