package com.kh.Final_cccc.admin.model.service;

import java.util.ArrayList;



import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.admin.model.vo.Rank;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.survey.model.vo.Survey;
//import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.sun.javafx.collections.MappingChange.Map;

public interface AdminService {

	ArrayList<MemberVO> selectMemberList(PageInfo pi);

//	ArrayList<Recipe> selectRecipeList();

	int getMemberListCount();

	MemberVO getMemberDetail(String id);

	int getUpdateMemberStatus(MemberVO m);

	int getMateListCount();

	ArrayList<Material> selectMateList(PageInfo pi);

	Board getBoardDetail(String id);

	int searchMemberListCount(MemberVO m);

	ArrayList<MemberVO> selectSearchMemberResultList(MemberVO m, PageInfo pi);

	int searchNoticeListCount(Board b);

	ArrayList<MemberVO> selectSearchNoticeResultList(Board b, PageInfo pi);

	int searchQAListCount(Board b);

	ArrayList<MemberVO> selectSearchQAResultList(Board b, PageInfo pi);

	int searchEventListCount(Event e);

	ArrayList<Event> selectSearchEventResultList(Event e, PageInfo pi);

	int deleteEvent(String check);


	int WomanCount();

	int manCount();


	ArrayList<MemberVO> getmemberList();

	ArrayList<Survey> getSurveyList();

	ArrayList<Rank> getmateList();

	ArrayList<Rank> getspeList();

	ArrayList<Integer> getDateCount();

	int getRecipeListCount();

	ArrayList<Recipe> selectRecipeList(PageInfo pi);

	int getDeleteRecipe(Recipe recipe);
	
	int getSearchRecipeListCount(Recipe recipe);

	ArrayList<Recipe> selectSearchRecipeResultList(Recipe recipe, PageInfo pi);

	
	

}