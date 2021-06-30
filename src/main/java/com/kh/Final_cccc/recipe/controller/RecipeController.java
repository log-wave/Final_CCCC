package com.kh.Final_cccc.recipe.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		//재료정보
		ArrayList<ReMaterial> r_mate = rService.selectrMate(recipeNo);
		//조리과정
		ArrayList<RecipeProcess> r_process = rService.selectProcess(recipeNo);
		
		//영양정보
		
		//회원정보 고민해볼것
		
		/*
		 * System.out.println("개요 : " + r_info); System.out.println("재료정보 : " + r_mate);
		 * System.out.println("조리과정 : " + r_process);
		 */
		
		model.addAttribute("r_info", r_info).addAttribute("r_mate",r_mate).addAttribute("r_process", r_process);
		return "/RecipeDetail/RecipeDetail";
	}
}
