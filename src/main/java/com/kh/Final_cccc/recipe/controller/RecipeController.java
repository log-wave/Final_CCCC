package com.kh.Final_cccc.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.recipe.model.service.RecipeService;
import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService rService;
	
	@RequestMapping("RList.rp")
	public ModelAndView RecipeList(@RequestParam("sort_no") int sort_no, @RequestParam("type") int type,
			ModelAndView mv) {

		
		ArrayList<Recipe> rList = null;
		switch(type) {
		case 1: rList = rService.selectsubList(sort_no); break;
		case 2: rList = rService.selectmateList(sort_no); break;
		case 3: rList = rService.selectspecList(sort_no); break;
		}
		
		System.out.println(rList);
		
		if(rList != null) {
			mv.addObject("rList", rList).setViewName("/searchRecipe/searchRecipe");
		}
		return mv;
	}
	
	@RequestMapping("rDetail.rp")
	public String RecipeList(@RequestParam("recipeNo") int recipeNo, Model model) {
		

		
		//레시피 개요
		Recipe r_info = rService.selectRecipe(recipeNo);
		//재료정보(영양정보& 재료목록)
		ArrayList<ReMaterial> r_mate = rService.selectrMate(recipeNo);
		//조리과정
		ArrayList<RecipeProcess> r_process = rService.selectProcess(recipeNo);
		
		//회원정보 고민해볼것
		
		//영양정보  계산하기
		int kcal = 0, fat = 0, protein = 0, carbo = 0, sugar = 0;
		
		if(r_mate != null) {
			for(int i = 0; i < r_mate.size(); i++) {
				//칼로리
				kcal += r_mate.get(i).getKcal();
				//단백질
				protein += r_mate.get(i).getProtein();
				//지방
				fat += r_mate.get(i).getFat();
				//탄수화물
				carbo += r_mate.get(i).getCarbo();
				//당
				sugar += r_mate.get(i).getSugar();
			}
		}
		int nutritionArr[] = {kcal, protein, fat, carbo, sugar};
		
		ArrayList<Integer> nutlist = new ArrayList<>();
		for(int i = 0; i < nutritionArr.length; i++) {
			nutlist.add(nutritionArr[i]);
		}
		
		
		model.addAttribute("r_info", r_info).addAttribute("r_mate",r_mate).addAttribute("r_process", r_process).addAttribute("nutArr", nutlist);
		return "/RecipeDetail/RecipeDetail";
	}
	
	@RequestMapping("insertRecipeForm.rp")
	public String insertRpform() {
		
		return "/insertRecipe/InsertRecipe";
	}
	
	@RequestMapping("MList.rp")
	@ResponseBody
	public void MateList(@RequestParam("mNo") int mNo, HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println("m : "+mNo);
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Material> mList = rService.selectmaterialList(mNo);
		
		System.out.println(mList);
		
		new GsonBuilder().create().toJson(mList, response.getWriter());
	}
	
	@RequestMapping("insertRecipe.rp")
	public void insertRecipe(HttpServletRequest request) {
		
		//추가된 재료 배열과 재료에 맞는 조리시간
		String[] mNoArr = request.getParameterValues("rp_mate");
		String[] mAmArr = request.getParameterValues("mate_amount");
		for(int i = 0; i < mNoArr.length; i++) {
//			System.out.println("번호 : "+mNoArr[i] + "/ 조리시간 : " + mAmArr[i]);
			
			//한번씩 메소드를 호출해서 보내줘야
		}
		
		//조리과정
		String[] pr_Content = request.getParameterValues("rp_content");
		for(int i = 0; i < pr_Content.length; i++) {
			System.out.println("텍스트 에어리어 : " + pr_Content[i]);
		}
	}
}

