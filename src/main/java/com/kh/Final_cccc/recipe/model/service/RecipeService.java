package com.kh.Final_cccc.recipe.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.recipe.model.vo.PageInfo;
import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;
import com.kh.Final_cccc.recipe.model.vo.Recipe_spec;
import com.kh.Final_cccc.recipe.model.vo.Reply;
import com.kh.Final_cccc.recipe.model.vo.Scrap;
import com.kh.Final_cccc.speciality.model.vo.Speciality;

public interface RecipeService {
   
   //sorting 기능
   //주제별 
   ArrayList<Recipe> selectsubList(int sort_no, PageInfo pi);

   ArrayList<Recipe> selectmateList(int sort_no, PageInfo pi);

   ArrayList<Recipe> selectspecList(int sort_no, PageInfo pi);

   //레시피 상세보기 기능
   Recipe selectRecipe(int recipeNo);   //레시피 정보
   ArrayList<ReMaterial> selectrMate(int recipeNo);   //레시피 사용 재료
   ArrayList<RecipeProcess> selectProcess(int recipeNo);   //레시피 조리과정

   ArrayList<Material> selectmaterialList(int mNo);

   int insertRecipe(Recipe recipe);

   int insertRecipemate(ReMaterial mate);

   int insertRecipeProcess(String rp_coment);

   String selectUserName(int userNo);

   int insertReply(Reply reply);

   ArrayList<Reply> selectReplyList(int recipeNo);

   int selectScrapcheck(Scrap s);

   int insertScrap(Scrap s);

   int deleteScrap(Scrap s);

   int deleteRecipe(int rId);

   int getListCount();

   int increViewCount(int recipeNo);

   ArrayList<Recipe> mateSelectRecipeList(String mateRecipe, PageInfo pi);

   ArrayList<Speciality> selectSpecialityList(String sNo);

   String getSpecinfo(int sNo);

   int insertrecipeSpec(Recipe_spec rs);

   Recipe_spec selectSpec(int recipeNo);

   String selectSpecname(int speciality_no, int recipeNo);

   ArrayList<Recipe> mainPopularRecipe();

   ArrayList<Files> mainPopularRecipeFiles();

   ArrayList<Recipe> mainSpecialityRecipe();

   ArrayList<Files> mainSpecialityRecipeFiles();

   ArrayList<Material> selectSearchMaterialList(String sv);

   Files selectprofile(int user_no);

   String selectspecinfo(int recipeNo);

   ArrayList<Recipe> selectSearchKeyword(HashMap sc, PageInfo pi);


   

}