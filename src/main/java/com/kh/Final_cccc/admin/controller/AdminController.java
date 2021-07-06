package com.kh.Final_cccc.admin.controller;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.service.BoardService;
import com.kh.Final_cccc.common.PagenationAdmin;
import com.kh.Final_cccc.common.Pagination;
import com.kh.Final_cccc.material.model.service.MaterialService;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;

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
		
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
		
		ArrayList<MemberVO> list = adService.selectMemberList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_member/admin_Member");
		} else {
			return null;
		}
		
		return mv;
	}
	
	@RequestMapping("memberDetailForm.ad")
	public String myInfoView(@RequestParam(value="id") String id, Model model) {
		MemberVO member = adService.getMemberDetail(id);
		
		if(member != null) {
			model.addAttribute("m", member);
			return "admin_member/admin_mypage";
		} else {
			System.out.println("안됨");
			return null;
		}
		
	}
	
	@RequestMapping("updateMemberStatus.ad")
	public String updateMemberStatus(@RequestParam(value="check[]", required=false) String[] check, @RequestParam(value="status", required=false) String status, @ModelAttribute MemberVO m) {
		int result = 0;
		for(int i = 0; i <= check.length - 1; i++ ) {
			m.setUser_id(check[i]);
			m.setStatus(status);
			result = adService.getUpdateMemberStatus(m);
		}
		
		if(result > 0) {
			return "redirect:adminMember.ad";
		} else {
			System.out.println("안됨");
			return null;
		}
	}
	
	@RequestMapping("adminRecipe.ad")
	public String adminRecipeList(Model model) {
//		ArrayList<Recipe> list = adService.selectRecipeList();
//		if(list != null) {
//			model.addAttribute("list", list);
			return "../admin/admin_recipe/admin_Recipe";
//		} else {
//			return "../admin/admin_recipe/admin_Recipe";
//		}
		
	}
	
	@RequestMapping("adminMaterial.ad")
	public ModelAndView adminMaterialList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adService.getMateListCount();
		
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
		
		ArrayList<Material> list = adService.selectMateList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_material/admin_Material");
		} else {
			return null;
		}
		
		return mv;
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
		
		com.kh.Final_cccc.board.model.vo.PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_notice/admin_Notice");
		} else {
			return null;
		}
		
		return mv;
	}
	
	@RequestMapping("noticeDetailForm.ad")
	public String noticeDetail(@RequestParam(value="id") int id, Model model) {
		Board board = bService.selectBoard(id);
		
		if(board != null) {
			model.addAttribute("board", board);
			return "admin_notice/admin_noticeDetail";
		} else {
			System.out.println("실패");
			return null;
		}
	}
	
	@RequestMapping("binsertView.ad")
	public String boardInsertForm() {
		return "../Notice/insertNotice/insertNotice";
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
	@RequestMapping("insertMateForm.ad")
	public String admininsertmateForm() {
		return"../admin/admin_material/insertMateForm/insertmateForm";
	}
	
}