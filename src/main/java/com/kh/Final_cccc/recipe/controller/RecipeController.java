package com.kh.Final_cccc.recipe.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.recipe.model.service.RecipeService;
import com.kh.Final_cccc.recipe.model.vo.Recipe;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService rService;
	
	@RequestMapping("RList.rp")
	public ModelAndView RecipeList(@RequestParam("sort_no") int sort_no, @RequestParam("type") int type,
			ModelAndView mv) {
//		System.out.println("no : " + sort_no + "type : " + type);
		
		ArrayList<Recipe> rList = null;
		switch(type) {
		case 1: rList = rService.selectsubList(sort_no); break;
		case 2: rList = rService.selectmateList(sort_no); break;
		case 3: rList = rService.selectspecList(sort_no); break;
		}
		return null;
	}
}
