package com.kh.Final_cccc.member.model.dao;

import java.util.Map;

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
	
	//파라미터가 여러 개 있으므로 map 형식으로 리턴 



	public int deleteMemberCheck(SqlSessionTemplate sqlSession, MemberVO m) {
		loggger.info("회원탈퇴체크 DAO 진입성공");
		
		return sqlSession.update("memberMapper.deleteMemberCheck", m);
	
	}

	public int count_pass_cnt(SqlSessionTemplate sqlSession, MemberVO m) {
		
		loggger.info("회원탈퇴체크 DAO 진입성공");
		
		return sqlSession.update("memberMapper.count_pass_cnt", m);
	}

	public int count_DeleteMemberCheck_Num(SqlSessionTemplate sqlSession, MemberVO m) {
		
		loggger.info("회원탈퇴 카운트 검사 dao 진입");
		
		return sqlSession.selectOne("memberMapper.count_DeleteMemberCheck_Num", m);
		
	
	}

	public MemberVO loginCheck(SqlSessionTemplate sqlSession, MemberVO m) {
		loggger.info("loginCheck dao 진입 성공");
		
		return sqlSession.selectOne("memberMapper.loginCheck", m);
		
	}

	public int reset_pass_cnt(SqlSessionTemplate sqlSession, String user_id) {
		loggger.info("reset_pass_cnt dao 진입 성공");
		return sqlSession.update("memberMapper.reset_pass_cnt", user_id);
		
	}

	public int member_yn_chk(SqlSessionTemplate sqlSession, int user_no) {
		loggger.info("member_yn_chk dao 진입 성공");
		return sqlSession.update("memberMapper.member_yn_chk", user_no);
	}


	public MemberVO findIdresult(SqlSessionTemplate sqlSession, String email) {
		loggger.info("findIdresult dao 진입 성공");
		System.out.println(email);
		return sqlSession.selectOne("memberMapper.find_id_result", email);
	}

	
	public int Edit_MyInform(SqlSessionTemplate sqlSession, MemberVO m) {
        loggger.info("Edit_MyInform dao 진입 성공");
        System.out.println(m);
        return sqlSession.update("memberMapper.edit_my_Inform", m);
    }

}
