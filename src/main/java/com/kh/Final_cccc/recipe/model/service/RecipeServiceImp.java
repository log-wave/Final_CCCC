package com.kh.Final_cccc.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.recipe.model.dao.recipeDAO;
import com.kh.Final_cccc.recipe.model.vo.Recipe;

@Service("rService")
public class RecipeServiceImp implements RecipeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private recipeDAO rDAO;

	@Override
	public ArrayList<Recipe> selectsubList(int sort_no) {
		// 주제별 목록 불러오기
		return rDAO.selectsubList(sort_no, sqlSession);
	}

	@Override
	public ArrayList<Recipe> selectmateList(int sort_no) {
		// 재료별 목록 불러오기
		return rDAO.selectmateList(sort_no, sqlSession);
	}

	@Override
	public ArrayList<Recipe> selectspecList(int sort_no) {
		// 특산물별 목록 불러오기
		return rDAO.selectspecList(sort_no, sqlSession);
	}
	
	
}
