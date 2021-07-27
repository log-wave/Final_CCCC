package com.kh.Final_cccc.admin.model.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.admin.model.vo.Rank;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.survey.model.vo.Survey;
import com.sun.javafx.collections.MappingChange.Map;

@Repository("adDAO")
public class AdminDAO {

	public ArrayList<MemberVO> getSelectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}

//	public ArrayList<Recipe> getSelectRecipeList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("adminMapper.selectRecipeList");
//	}

	public int getMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMemberListCount");
	}

	public MemberVO getMemberDetail(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("adminMapper.memberDetail", id);
	}

	public int getUpdateMemberStatus(SqlSessionTemplate sqlSession, MemberVO m) {
		return sqlSession.update("adminMapper.memberStatusUpdate", m);
	}

	public int getMateListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMateListCount");
	}

	public ArrayList<Material> getSelectMateList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return  (ArrayList)sqlSession.selectList("adminMapper.getSelectMateList", null, rowBounds);
	}

	public Board getBoardDetail(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("adminMapper.boardDetail", id);
	}

	public int searchMemberListCount(SqlSessionTemplate sqlSession, MemberVO m) {
		return sqlSession.selectOne("adminMapper.searchMemberListCount", m);
	}

	public ArrayList<MemberVO> selectSearchMemberResultList(SqlSessionTemplate sqlSession, MemberVO m, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchMemberResultList" , m, rowBounds);
	}

	public int selectSearchNoticeListCount(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("adminMapper.searchNoticeListCount", b);
	}

	public ArrayList<MemberVO> selectSearchNoticeResultList(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchNoticeResultList" , b, rowBounds);
	}

	public int selectSearchQAListCount(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("adminMapper.searchQAListCount", b);
	}

	public ArrayList<MemberVO> selectSearchQAResultList(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchQAResultList" , b, rowBounds);
	}

	public int selectSearchEventListCount(SqlSessionTemplate sqlSession, Event e) {
		return sqlSession.selectOne("adminMapper.searchEventListCount", e);
	}

	public ArrayList<Event> selectSearchEventResultList(SqlSessionTemplate sqlSession, Event e, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchEventResultList", e, rowBounds);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, String check) {
		int eNo = Integer.parseInt(check);
		
		return sqlSession.update("adminMapper.deleteEvent", eNo);
	}

	public int WomanCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.womanCount");
	}

	public int manCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.manCount");
	}

	public ArrayList<MemberVO> getmemberList(SqlSessionTemplate sqlSession) {
		return  (ArrayList)sqlSession.selectList("adminMapper.getmemberList");
	}

	public ArrayList<Survey> getSurveyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getSurveyList");
	}

	public ArrayList<Rank> getmateList(SqlSessionTemplate sqlSession) {
		return  (ArrayList)sqlSession.selectList("adminMapper.getmateList");
	}

	public ArrayList<Rank> getspeList(SqlSessionTemplate sqlSession) {
		return  (ArrayList)sqlSession.selectList("adminMapper.getspeList");
	}

	public ArrayList<Integer> getDateCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getDateCount");
		
	}

}
