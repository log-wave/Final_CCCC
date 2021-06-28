package com.kh.Final_cccc.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.recipe.model.vo.Recipe;

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

}
