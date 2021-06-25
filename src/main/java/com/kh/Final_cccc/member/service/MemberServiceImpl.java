package com.kh.Final_cccc.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.member.model.dao.MemberDAO;
import com.kh.Final_cccc.member.model.vo.MemberVO;

@Service("mService") // Service성질을 갖는 객체 생성
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public MemberVO memberLogin(MemberVO m) {
		
		return mDAO.memberLogin(sqlSession, m);
	
	

	}
}
