package com.kh.Final_cccc.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;

@Repository("rDAO")
public class recipeDAO {

	public ArrayList<Recipe> selectsubList(int sort_no, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectsubList", sort_no);
	}

	public ArrayList<Recipe> selectmateList(int sort_no, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectmateList", sort_no);
	}

	public ArrayList<Recipe> selectspecList(int sort_no, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectspecList", sort_no);
	}

	public Recipe selectRecipe(int recipeNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.selectRecipe", recipeNo);
	}

	public ArrayList<ReMaterial> selectrMate(int recipeNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectrMate", recipeNo);
	}

	public ArrayList<RecipeProcess> selectProcess(int recipeNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectProcess", recipeNo);
	}

}
