package com.kh.Final_cccc.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.member.model.vo.MemberVO;

@Repository("mDAO")
public class MemberDAO {

	public MemberVO memberLogin(SqlSessionTemplate sqlSession, MemberVO m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
	}

}
