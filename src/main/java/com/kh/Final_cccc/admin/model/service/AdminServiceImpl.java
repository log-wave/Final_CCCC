package com.kh.Final_cccc.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.dao.AdminDAO;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.recipe.model.vo.Recipe;

@Service("adService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adDAO;

	@Override
	public ArrayList<MemberVO> selectMemberList() {
		return adDAO.getSelectMemberList(sqlSession);
	}

	@Override
	public ArrayList<Recipe> selectRecipeList() {
		return adDAO.getSelectRecipeList(sqlSession);
	}

	@Override
	public ArrayList<Event> selectEventList() {
		return adDAO.getSelectEventList(sqlSession);
	}
}
