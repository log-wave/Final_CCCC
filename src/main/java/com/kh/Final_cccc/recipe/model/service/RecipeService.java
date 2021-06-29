package com.kh.Final_cccc.recipe.model.service;

import java.util.ArrayList;

import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;

public interface RecipeService {

	ArrayList<Recipe> selectsubList(int sort_no);

	ArrayList<Recipe> selectmateList(int sort_no);

	ArrayList<Recipe> selectspecList(int sort_no);

	Recipe selectRecipe(int recipeNo);

	ArrayList<ReMaterial> selectrMate(int recipeNo);

	ArrayList<RecipeProcess> selectProcess(int recipeNo);

}
