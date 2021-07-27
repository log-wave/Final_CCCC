package com.kh.Final_cccc.recipe.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository("rDAO")
public class recipeDAO {

	public ArrayList<Recipe> selectsubList(int sort_no, SqlSessionTemplate sqlSession, PageInfo pi) {
		// 주제별 검색
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipeMapper.selectsubList", sort_no, rowBounds);
	}

	public ArrayList<Recipe> selectmateList(int sort_no, SqlSessionTemplate sqlSession, PageInfo pi) {
		// 재료별 검색
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipeMapper.selectmateList", sort_no, rowBounds);
	}

	public ArrayList<Recipe> selectspecList(int sort_no, SqlSessionTemplate sqlSession, PageInfo pi) {
		// 특산물 검색
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipeMapper.selectspecList", sort_no, rowBounds);
	}

	public Recipe selectRecipe(int recipeNo, SqlSessionTemplate sqlSession) {
		// 레시피 선택
		return sqlSession.selectOne("recipeMapper.selectRecipe", recipeNo);
	}

	public ArrayList<ReMaterial> selectrMate(int recipeNo, SqlSessionTemplate sqlSession) {
		// 레시피 재료 불러오기
		return (ArrayList)sqlSession.selectList("recipeMapper.selectrMate", recipeNo);
	}

	public ArrayList<RecipeProcess> selectProcess(int recipeNo, SqlSessionTemplate sqlSession) {
		// 조리과정 불러오기
		return (ArrayList)sqlSession.selectList("recipeMapper.selectProcess", recipeNo);
	}

	public ArrayList<Material> selectmaterialList(SqlSessionTemplate sqlSession, int mNo) {
		// 재료 리스트 가져오기
		return (ArrayList)sqlSession.selectList("recipeMapper.selectMaterialList", mNo);
	}

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe recipe) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertRecipe", recipe);
	}

	public int insertRecipemate(SqlSessionTemplate sqlSession, ReMaterial mate) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertRecipeMate", mate);
	}

	public int insertRecipeProcess(SqlSessionTemplate sqlSession, String rp_coment) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertRecipeProcess", rp_coment);
	}

	public String selectUserName(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.selectUserName", userNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertReply", reply);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int recipeNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectReplyList", recipeNo);
	}

	public int selectScrapcheck(SqlSessionTemplate sqlSession, Scrap s) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.selectScrapcheck", s);
	}

	public int insertScrap(SqlSessionTemplate sqlSession, Scrap s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.inesertScrap", s);
	}

	public int deleteScrap(SqlSessionTemplate sqlSession, Scrap s) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recipeMapper.deleteScrap", s);
	}

	public int deleteRecipe(SqlSessionTemplate sqlSession, int rId) {
		// TODO Auto-generated method stub
		return sqlSession.update("recipeMapper.deleteRecipe", rId);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.getListCount");
	}

	public int increViewCount(SqlSessionTemplate sqlSession, int recipeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("recipeMapper.increViewCount", recipeNo);
	}

	public ArrayList<Recipe> mateSelectRecipeList(SqlSessionTemplate sqlSession, String mateRecipe) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectMateRecipeList", mateRecipe);
	}

	public ArrayList<Speciality> selectSpecialityList(SqlSessionTemplate sqlSession, String sNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("recipeMapper.selectSpecialityList", sNo);
	}

	public String getSpecinfo(SqlSessionTemplate sqlSession, int sNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.selectSpecinfo", sNo);
	}

	public int insertRecipeSpec(SqlSessionTemplate sqlSession, Recipe_spec rs) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.inesrtRecipeSpec", rs);
	}

	public Recipe_spec selectSpec(SqlSessionTemplate sqlSession, int recipeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.selectSpec", recipeNo);
	}

	public String selectSpecname(SqlSessionTemplate sqlSession, int speciality_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.selectSpecname", speciality_no);
	}

	public ArrayList<Recipe> mainPopularRecipe(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.mainPopularRecipe");
	}

	public ArrayList<Files> mainPopularRecipeFiles(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.mainPopularRecipeFiles");
	}

	public ArrayList<Recipe> mainSpecialityRecipe(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.mainSpecialityRecipe");
	}

	public ArrayList<Files> mainSpecialityRecipeFiles(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.mainSpecialityRecipeFiles");
	}


}
