package com.kh.Final_cccc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("adminMember.ad")
	public String adminMemberList() {
		return "../admin/admin_member/admin_Member";
	}
	
	@RequestMapping("adminRecipe.ad")
	public String adminRecipeList() {
		return "../admin/admin_recipe/admin_Recipe";
	}
	
	@RequestMapping("adminMaterial.ad")
	public String adminMaterialList() {
		return "../admin/admin_food/admin_Food";
	}
	
	@RequestMapping("adminSpeciality.ad")
	public String adminSpecialityList() {
		return "../admin/admin_specialty/admin_Specialty";
	}
	
	@RequestMapping("adminQAboard.ad")
	public String adminQAboardList() {
		return "../admin/admin_QA/admin_QA";
	}
	
	@RequestMapping("adminBoard.ad")
	public String adminBoardList() {
		return "../admin/admin_notice/admin_Notice";
	}
	
	@RequestMapping("adminEvent.ad")
	public String adminEventList() {
		return "../admin/admin_event/admin_Event";
	}
	
	@RequestMapping("adminSurvey.ad")
	public String adminSurveyList() {
		return "../admin/admin_member/admin_Member";
	}

}
