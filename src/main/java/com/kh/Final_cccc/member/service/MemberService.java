package com.kh.Final_cccc.member.service;

import com.kh.Final_cccc.member.model.vo.MemberVO;

public interface MemberService {

	
	MemberVO memberLogin(MemberVO m);

	int userIdCheck(String user_id);

	int nickNameCheck(String nickName);
	
}
