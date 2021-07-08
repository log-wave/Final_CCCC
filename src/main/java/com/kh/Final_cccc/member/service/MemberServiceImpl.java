package com.kh.Final_cccc.member.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.member.model.dao.MemberDAO;
import com.kh.Final_cccc.member.model.vo.MemberVO;

@Service("mService") // Service성질을 갖는 객체 생성
public class MemberServiceImpl implements MemberService{
	
	private static Logger loggger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	
	
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public MemberVO memberLogin(MemberVO m) {
		
		return mDAO.memberLogin(sqlSession, m);
	
	

	}

	@Override
	public int userIdCheck(String user_id) {
		
		return mDAO.idCheck(sqlSession, user_id);
	}

	@Override
	public int nickNameCheck(String nickName) {
		
		return mDAO.nickNameCheck(sqlSession,nickName);
	}

	@Override
	public int insertMember(MemberVO m) {
		loggger.info("insertMember 서비스impl 진입성공");
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int emailCheck(String email) {
		loggger.info("이메일 중복검사 서비스Impl 진입성공");
		return mDAO.emailCheck(sqlSession, email);
	}

	@Override
	public int deleteMemberCheck(MemberVO m) {
		
		loggger.info("회원탈퇴체크 서비스 impl 진입성공");
		return mDAO.deleteMemberCheck(sqlSession,m);
	}

	@Override
	public int count_pass_cnt(MemberVO m) {
		

		loggger.info("회원탈퇴 카운트  서비스 impl 진입성공");
		return mDAO.count_pass_cnt(sqlSession,m);
		
	}

	@Override
	public int count_DeleteMemberCheck_Num(MemberVO m) {
		
		loggger.info("회원탈퇴 카운트 검사 서비스 impl 진입성공");
		return mDAO.count_DeleteMemberCheck_Num(sqlSession,m);
		
		
		
	}









	
}
