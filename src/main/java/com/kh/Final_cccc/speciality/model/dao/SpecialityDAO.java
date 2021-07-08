package com.kh.Final_cccc.speciality.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.speciality.model.vo.Speciality;

@Repository("speDAO")
public class SpecialityDAO {

	public int getSpeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("specialityMapper.getSpeListCount");
	}

	public ArrayList<Speciality> selectSpeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("specialityMapper.selectSpeList", null , rowBounds);
	}

	public Speciality selectSpeDetail(SqlSessionTemplate sqlSession, int specialityNo) {
		return sqlSession.selectOne("specialityMapper.selectSpeDetail", specialityNo);
	}

}
