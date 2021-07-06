package com.kh.Final_cccc.admin.model.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;

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

	public ArrayList<Event> getSelectEventList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectEventList");
	}

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

}
