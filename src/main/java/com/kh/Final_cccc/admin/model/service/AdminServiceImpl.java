package com.kh.Final_cccc.admin.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.dao.AdminDAO;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
//import com.kh.Final_cccc.recipe.model.vo.Recipe;

@Service("adService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adDAO;

//	@Override
//	public ArrayList<Recipe> selectRecipeList() {
//		return adDAO.getSelectRecipeList(sqlSession);
//	}

	@Override
	public ArrayList<Event> selectEventList() {
		return adDAO.getSelectEventList(sqlSession);
	}

	@Override
	public ArrayList<MemberVO> selectMemberList(PageInfo pi) {
		return adDAO.getSelectMemberList(sqlSession, pi);
	}

	@Override
	public int getMemberListCount() {
		return adDAO.getMemberListCount(sqlSession);
	}

	@Override
	public MemberVO getMemberDetail(String id) {
		return adDAO.getMemberDetail(sqlSession, id);
	}

	@Override
	public int getUpdateMemberStatus(MemberVO m) {
		return adDAO.getUpdateMemberStatus(sqlSession, m);
	}

	@Override
	public int getMateListCount() {
		return adDAO.getMateListCount(sqlSession);
	}

	@Override
	public ArrayList<Material> selectMateList(PageInfo pi) {
		return adDAO.getSelectMateList(sqlSession, pi);
	}

	@Override
	public Board getBoardDetail(String id) {
		return adDAO.getBoardDetail(sqlSession, id);
	}

	@Override
	public int searchMemberListCount(MemberVO m) {
		return adDAO.searchMemberListCount(sqlSession, m);
	}

	@Override
	public ArrayList<MemberVO> selectSearchMemberResultList(MemberVO m, PageInfo pi) {
		return adDAO.selectSearchMemberResultList(sqlSession, m, pi);
	}

	@Override
	public int searchNoticeListCount(Board b) {
		return adDAO.selectSearchNoticeListCount(sqlSession, b);
	}

	@Override
	public ArrayList<MemberVO> selectSearchNoticeResultList(Board b, PageInfo pi) {
		return adDAO.selectSearchNoticeResultList(sqlSession, b, pi);
	}

	@Override
	public int searchQAListCount(Board b) {
		return adDAO.selectSearchQAListCount(sqlSession, b);
	}

	@Override
	public ArrayList<MemberVO> selectSearchQAResultList(Board b, PageInfo pi) {
		return adDAO.selectSearchQAResultList(sqlSession, b, pi);
	}

}
