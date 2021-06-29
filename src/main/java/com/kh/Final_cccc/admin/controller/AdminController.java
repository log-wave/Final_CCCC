package com.kh.Final_cccc.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
import com.kh.Final_cccc.board.service.BoardService;
import com.kh.Final_cccc.common.Pagination;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.recipe.model.vo.Recipe;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("adminMember.ad")
	public ModelAndView adminMemberList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adService.getMemberListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MemberVO> list = adService.selectMemberList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_member/admin_Member");
		} else {
			return null;
		}
		
		return mv;
	}
	
	@RequestMapping("adminRecipe.ad")
	public String adminRecipeList(Model model) {
		ArrayList<Recipe> list = adService.selectRecipeList();
		if(list != null) {
			model.addAttribute("list", list);
			return "../admin/admin_recipe/admin_Recipe";
		} else {
			return "../admin/admin_recipe/admin_Recipe";
		}
		
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
	public ModelAndView adminBoardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_notice/admin_Notice");
		} else {
			return null;
		}
		
		return mv;
	}
	
	@RequestMapping("adminEvent.ad")
	public String adminEventList(Model model) {
		ArrayList<Event> list = adService.selectEventList();
		if(list != null) {
			model.addAttribute("list", list);
			return "../admin/admin_event/admin_Event";
		} else {
			return "../admin/admin_event/admin_Event";
		}
	}
	
	@RequestMapping("adminSurvey.ad")
	public String adminSurveyList() {
		return "../admin/admin_member/admin_Member";
	}

}
