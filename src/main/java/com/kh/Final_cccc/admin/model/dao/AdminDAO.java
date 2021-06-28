package com.kh.Final_cccc.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.member.model.vo.MemberVO;

@Repository("adDAO")
public class AdminDAO {

	public ArrayList<MemberVO> getSelectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList");
	}

}
