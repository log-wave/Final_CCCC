package com.kh.Final_cccc.admin.model.service;

import java.util.ArrayList;


import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
//import com.kh.Final_cccc.recipe.model.vo.Recipe;

public interface AdminService {

	ArrayList<MemberVO> selectMemberList(PageInfo pi);

//	ArrayList<Recipe> selectRecipeList();

	ArrayList<Event> selectEventList();

	int getMemberListCount();

	MemberVO getMemberDetail(String id);

	int getUpdateMemberStatus(MemberVO m);

	int getMateListCount();

	ArrayList<Material> selectMateList(PageInfo pi);


}
