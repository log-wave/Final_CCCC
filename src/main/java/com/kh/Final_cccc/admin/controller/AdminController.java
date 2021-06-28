package com.kh.Final_cccc.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.member.model.vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	@RequestMapping("adminMember.ad")
	public String adminMemberList(Model model) {
		ArrayList<MemberVO> list = adService.selectMemberList();
		if(list != null) {
			model.addAttribute("list", list);
			return "../admin/admin_member/admin_Member";
		} else {
			return "../admin/admin_member/admin_Member";
		}
		
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
