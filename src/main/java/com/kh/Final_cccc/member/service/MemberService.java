package com.kh.Final_cccc.member.service;


import java.util.ArrayList;

import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.member.model.vo.PageInfo;
import com.kh.Final_cccc.recipe.model.vo.Recipe;

public interface MemberService {

	
	
	MemberVO memberLogin(MemberVO m);

	int userIdCheck(String user_id);

	int nickNameCheck(String nickName);

	int insertMember(MemberVO m);

	int emailCheck(String email);

	int deleteMemberCheck(MemberVO m);

	int count_pass_cnt(MemberVO m);

	int count_DeleteMemberCheck_Num(MemberVO m);

	MemberVO loginCheck(MemberVO m);

	int reset_pass_cnt(String user_id);

	int member_yn_chk(int user_no);

	MemberVO findIdresult(String email);

	int Edit_MyInform(MemberVO m);

	int user_profile_change(Files files);

	String select_user_profile_changeName(Files files);
	
	String selectChangeName(int user_no);

	void delete_user_profile(int user_no);
	
	int userIdemailCheck(MemberVO m);

    int updatePwd(MemberVO m);

    MemberVO findPwdresult(String user_id);

    String select_userPw(MemberVO m);
    
    int getListCount();

    ArrayList<Recipe> selectmrList(PageInfo pi, int user_no);

    ArrayList<Files> selectmrfileList(PageInfo pi, int user_no);
    
    
	
}
