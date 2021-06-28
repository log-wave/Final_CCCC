package com.kh.Final_cccc.recipe.model.service;

import java.util.ArrayList;

import com.kh.Final_cccc.recipe.model.vo.Recipe;

public interface RecipeService {

	ArrayList<Recipe> selectsubList(int sort_no);

	ArrayList<Recipe> selectmateList(int sort_no);

	ArrayList<Recipe> selectspecList(int sort_no);

}
