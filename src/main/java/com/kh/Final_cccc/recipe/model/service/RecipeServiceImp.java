package com.kh.Final_cccc.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.recipe.model.dao.recipeDAO;
import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;

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

	@Override
	public Recipe selectRecipe(int recipeNo) {
		// 레시피 정보
		return rDAO.selectRecipe(recipeNo, sqlSession);
	}

	@Override
	public ArrayList<ReMaterial> selectrMate(int recipeNo) {
		// 레시피 사용 재료
		return rDAO.selectrMate(recipeNo, sqlSession);
	}

	@Override
	public ArrayList<RecipeProcess> selectProcess(int recipeNo) {
		// 레시피 조리과정
		return rDAO.selectProcess(recipeNo, sqlSession);
	}

	@Override
	public ArrayList<Material> selectmaterialList(int mNo) {
		// 재료리스트 가져오기
		return rDAO.selectmaterialList(sqlSession, mNo);
	}

	@Override
	public int insertRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		return rDAO.insertRecipe(sqlSession, recipe);
	}

	@Override
	public int insertRecipemate(ReMaterial mate) {
		// TODO Auto-generated method stub
		return rDAO.insertRecipemate(sqlSession, mate);
	}

	@Override
	public int insertRecipeProcess(String rp_coment) {
		// TODO Auto-generated method stub
		return rDAO.insertRecipeProcess(sqlSession, rp_coment);
	}
	
	
}
