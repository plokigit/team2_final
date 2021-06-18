package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;

	private synchronized static SqlSession getSession() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(false); // 수동 commit();
		}
		return ss;
	}

//	결과가 여러개 List<VO> -> selectList()
//	결과가 하나 VO -> selectOne()
//	파라미터 값이 없을 때 
//	파라미터 값이 있을 때(파라미터가 2개 이상이면 무조건 VO 아니면 Map을 사용해야 함 
	
	public static List<BVO> getLogIn(BVO bvo) {
		List<BVO> vo = null;
		vo = getSession().selectList("login", bvo);
		ss.commit();

		return vo;
	}

	public static List<BVO> getList(int begin, int end) {
		List<BVO> list = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		list = getSession().selectList("list", map);

		return list;
	}

	public static BVO getDetail(String id) {
		BVO bvo = null;
		bvo = getSession().selectOne("detail", id);
		return bvo;
	}

//	getSession().insert("mapper id", parameter)
	public static int getWrite(BVO bvo) {
		int result = 0;
		result = getSession().insert("write", bvo);
		ss.commit();

		return result;
	}

	public static int getUpdate(BVO bvo) {
		int result = 0;
		result = getSession().update("update", bvo);
		ss.commit();

		return result;
	}

	public static int getComment_delete_all(String b_idx) { // 원글 밑의 댓글 모두 삭제
		int result = 0;
		result = getSession().delete("comment_delete_all", b_idx);
		ss.commit();

		return result;
	}

	public static int getDelete(BVO bvo) {
		int result = 0;
		result = getSession().delete("delete", bvo);
		ss.commit();

		return result;
	}

	public static int getHitUp(String b_idx) {
		int result = 0;
		result = getSession().update("hitup", b_idx);
		ss.commit();

		return result;
	}

	public static List<CVO> getClist(String b_idx) {
		List<CVO> c_list = null;
		c_list = getSession().selectList("c_list", b_idx);

		return c_list;
	}

	public static int getComment_write(CVO cvo) {
		int result = 0;
		result = getSession().insert("comment_write", cvo);
		ss.commit();

		return result;
	}

	public static int getComment_delete(String c_idx) {
		int result = 0;
		result = getSession().delete("comment_delete", c_idx);
		ss.commit();

		return result;
	}

	public static int getCount() {
		int result = 0;
		result = getSession().selectOne("count");
		ss.commit();

		return result;
	}

	public static int getJoin(BVO bvo) {
		int result = 0;
		result = getSession().insert("join", bvo);
		ss.commit();

		return result;
	}

}