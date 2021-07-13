package com.kh.Final_cccc.recipe.model.service;

import java.util.ArrayList;

import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;

public interface RecipeService {
	
	//sorting 기능
	//주제별 
	ArrayList<Recipe> selectsubList(int sort_no);

	ArrayList<Recipe> selectmateList(int sort_no);

	ArrayList<Recipe> selectspecList(int sort_no);

	//레시피 상세보기 기능
	Recipe selectRecipe(int recipeNo);	//레시피 정보
	ArrayList<ReMaterial> selectrMate(int recipeNo);	//레시피 사용 재료
	ArrayList<RecipeProcess> selectProcess(int recipeNo);	//레시피 조리과정

	ArrayList<Material> selectmaterialList(int mNo);

	int insertRecipe(Recipe recipe);

	int insertRecipemate(ReMaterial mate);

}
