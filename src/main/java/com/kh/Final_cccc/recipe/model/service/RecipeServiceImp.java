package com.kh.Final_cccc.recipe.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.recipe.model.dao.recipeDAO;
import com.kh.Final_cccc.recipe.model.vo.PageInfo;
import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;
import com.kh.Final_cccc.recipe.model.vo.Recipe_spec;
import com.kh.Final_cccc.recipe.model.vo.Reply;
import com.kh.Final_cccc.recipe.model.vo.Scrap;
import com.kh.Final_cccc.speciality.model.vo.Speciality;

@Service("rService")
public class RecipeServiceImp implements RecipeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private recipeDAO rDAO;

	@Override
	public ArrayList<Recipe> selectsubList(int sort_no, PageInfo pi) {
		// 주제별 목록 불러오기
		return rDAO.selectsubList(sort_no, sqlSession, pi);
	}

	@Override
	public ArrayList<Recipe> selectmateList(int sort_no, PageInfo pi) {
		// 재료별 목록 불러오기
		return rDAO.selectmateList(sort_no, sqlSession, pi);
	}

	@Override
	public ArrayList<Recipe> selectspecList(int sort_no, PageInfo pi) {
		// 특산물별 목록 불러오기
		return rDAO.selectspecList(sort_no, sqlSession, pi);
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

	@Override
	public String selectUserName(int userNo) {
		// TODO Auto-generated method stub
		return rDAO.selectUserName(sqlSession, userNo);
	}

	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return rDAO.insertReply(sqlSession, reply);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int recipeNo) {
		// TODO Auto-generated method stub
		return rDAO.selectReplyList(sqlSession, recipeNo);
	}

	@Override
	public int selectScrapcheck(Scrap s) {
		// TODO Auto-generated method stub
		return rDAO.selectScrapcheck(sqlSession, s);
	}

	@Override
	public int insertScrap(Scrap s) {
		// TODO Auto-generated method stub
		return rDAO.insertScrap(sqlSession, s);
	}

	@Override
	public int deleteScrap(Scrap s) {
		// TODO Auto-generated method stub
		return rDAO.deleteScrap(sqlSession, s);
	}

	@Override
	public int deleteRecipe(int rId) {
		// TODO Auto-generated method stub
		return rDAO.deleteRecipe(sqlSession, rId);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return rDAO.getListCount(sqlSession);
	}

	@Override
	public int increViewCount(int recipeNo) {
		// TODO Auto-generated method stub
		return rDAO.increViewCount(sqlSession, recipeNo);
	}

	@Override
	public ArrayList<Recipe> mateSelectRecipeList(String mateRecipe, PageInfo pi) {
		return rDAO.mateSelectRecipeList(sqlSession, mateRecipe, pi);
	}

	@Override
	public ArrayList<Speciality> selectSpecialityList(String sNo) {
		// TODO Auto-generated method stub
		return rDAO.selectSpecialityList(sqlSession, sNo);
	}

	@Override
	public String getSpecinfo(int sNo) {
		// TODO Auto-generated method stub
		return rDAO.getSpecinfo(sqlSession, sNo);
	}

	@Override
	public int insertrecipeSpec(Recipe_spec rs) {
		// TODO Auto-generated method stub
		return rDAO.insertRecipeSpec(sqlSession, rs);
	}

	@Override
	public Recipe_spec selectSpec(int recipeNo) {
		// TODO Auto-generated method stub
		return rDAO.selectSpec(sqlSession, recipeNo);
	}

	@Override
	public String selectSpecname(int speciality_no) {
		return rDAO.selectSpecname(sqlSession, speciality_no);
	}

	@Override
	public ArrayList<Recipe> mainPopularRecipe() {
		return rDAO.mainPopularRecipe(sqlSession);
	}

	@Override
	public ArrayList<Files> mainPopularRecipeFiles() {
		return rDAO.mainPopularRecipeFiles(sqlSession);
	}

	@Override
	public ArrayList<Recipe> mainSpecialityRecipe() {
		return rDAO.mainSpecialityRecipe(sqlSession);
	}

	@Override
	public ArrayList<Files> mainSpecialityRecipeFiles() {
		return rDAO.mainSpecialityRecipeFiles(sqlSession);
	}

	@Override
	public ArrayList<Material> selectSearchMaterialList(String sv) {
		return rDAO.selectSearchMaterialList(sqlSession, sv);
	}

	@Override
	public Files selectprofile(int user_no) {
		// TODO Auto-generated method stub
		return rDAO.selectprofile(sqlSession, user_no);
	}

	@Override
	public String selectspecinfo(int recipeNo) {
		// TODO Auto-generated method stub
		return rDAO.selectspecinfo(sqlSession, recipeNo);
	}

	@Override
	public ArrayList<Recipe> selectSearchKeyword(HashMap sc, PageInfo pi) {
		return rDAO.selectSearchKeyword(sqlSession, sc, pi);
	}



}
