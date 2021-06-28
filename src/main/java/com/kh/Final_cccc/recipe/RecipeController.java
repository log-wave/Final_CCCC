package com.kh.Final_cccc.recipe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RecipeController {
	
	@RequestMapping("RList.rp")
	public String RecipeList(@RequestParam("sort_no") int sort_no, @RequestParam("type") int type) {
		System.out.println("no : " + sort_no + "type : " + type);
		return null;
	}
}
