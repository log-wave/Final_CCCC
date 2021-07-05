package com.kh.Final_cccc.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.member.service.MemberServiceImpl;

@Repository("mDAO")
public class MemberDAO {

	
	private static Logger loggger = LoggerFactory.getLogger(MemberDAO.class);
	
	public MemberVO memberLogin(SqlSessionTemplate sqlSession, MemberVO m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession,String user_id) {
		
		return sqlSession.selectOne("memberMapper.idCheck", user_id);
	}

	public int nickNameCheck(SqlSessionTemplate sqlSession, String nickName) {
		
		return sqlSession.selectOne("memberMapper.nickNameCheck",nickName);
	}

	public int insertMember(SqlSessionTemplate sqlSession, MemberVO m) {
		loggger.info("insertMember DAO 진입성공");
		
		return sqlSession.insert("memberMapper.insertMember", m);
	
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String email) {
	
		loggger.info("이메일 중복검사 dao 진입 성공");
		System.out.println("이메일 종북체크" + email);
		
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}

}
