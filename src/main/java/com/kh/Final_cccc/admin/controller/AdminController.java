package com.kh.Final_cccc.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.Final_cccc.Event.exception.EventException;
import com.kh.Final_cccc.Event.model.service.EventService;
import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.Files.service.FilesService;
import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.service.BoardService;
import com.kh.Final_cccc.common.PagenationAdmin;
import com.kh.Final_cccc.common.Pagination;
import com.kh.Final_cccc.material.model.service.MaterialService;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.speciality.model.vo.Speciality;
import com.kh.Final_cccc.speciality.service.SpecialityService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private EventService eService;
	
	@Autowired
	private MaterialService maService;

	@Autowired
	private SpecialityService speService;
	
	@Autowired
	private FilesService fService;
	
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
	
	@RequestMapping("searchAdminMember.ad")
	public ModelAndView memberSearch(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String value, 
			@RequestParam("searchCondition") String condition, MemberVO m, ModelAndView mv) {
		
		if(condition.equals("no")) {
			m.setUser_no(Integer.parseInt(value));
		}
		else if(condition.equals("id")) {
			m.setUser_id(value);
		}
		else if(condition.equals("nick")) {
			m.setNickname(value);
		}
		else if(condition.equals("state")) {
			m.setStatus(value);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(!value.isEmpty()) {
			int listCount = adService.searchMemberListCount(m);
			
			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
			
			ArrayList<MemberVO> list = adService.selectSearchMemberResultList(m, pi);
			
			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue" , value).addObject("searchCondition", condition).setViewName("admin_member/admin_Member");
		}
		
		return mv;
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
	
	@RequestMapping("materialDetailForm.ad")
	public String mateInfoView(@RequestParam(value="no") int matrialNo, Model model) {
		Material material = maService.getMaterialDetail(matrialNo);
		
		if(material != null) {
			model.addAttribute("material", material);
			return "admin_material/admin_MaterialDetail";
		} else {
			System.out.println("재료 상세보기 실패");
			return null;
		}
	}
	
	@RequestMapping("insertMateForm.ad")
	public String admininsertmateForm() {
		return"../admin/admin_material/insertMateForm/insertmateForm";
	}
	
	@RequestMapping("adminSpeciality.ad")
	public ModelAndView adminSpecialityList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = speService.getSpeListCount();
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
		
		ArrayList<Speciality> list = speService.selectSpeList(pi);
		
		  if(list != null) {
			  mv.addObject("list", list).addObject("pi",pi).setViewName("admin_speciality/admin_Speciality"); 
		 } else { 
			 return null; 
		 }
		 
		return mv;
	
	}
	
	@RequestMapping("adminQAboard.ad")
	public ModelAndView adminQAboardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getqListCount();
		
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectAdminQList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_QA/admin_QA");
		} else {
			return null;
		}
		
		return mv;
	}
	
	@RequestMapping("qaDetailForm.ad")
	public String qaDetail(@RequestParam(value="id") int id, Model model) {
		Board board = bService.selectqaBoard(id);
		
		if(board != null) {
			model.addAttribute("board", board);
			return "admin_QA/admin_qaDetail";
		} else {
			System.out.println("실패");
			return null;
		}
	}
	
	@RequestMapping("deleteAnswer.ad")
	public void deleteAnswer(@RequestParam("bNo") String bNo, HttpServletResponse response) throws JsonIOException, IOException {
		int result = bService.deleteAnswer(bNo);
		
		String msg = null;
		if (result > 0)
			msg = "삭제 성공";
		else
			msg = "삭제 중 오류가 발생했습니다.";
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(msg, response.getWriter());
	}
	
	@RequestMapping("searchAdminQA.ad")
	public ModelAndView QASearch(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String value, 
			@RequestParam("searchCondition") String condition, Board b, ModelAndView mv) {
		
		if(condition.equals("no")) {
			b.setbNo(Integer.parseInt(value));
		}
		else if(condition.equals("title")) {
			b.setbTitle(value);
		}
		else if(condition.equals("content")) {
			b.setbContent(value);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(!value.isEmpty()) {
			int listCount = adService.searchQAListCount(b);
			
			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
			
			ArrayList<MemberVO> list = adService.selectSearchQAResultList(b, pi);
			
			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue" , value).addObject("searchCondition", condition).setViewName("admin_QA/admin_QA");
		}
		
		return mv;
	}
	
	@RequestMapping("adminBoard.ad")
	public ModelAndView adminBoardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectAdminList(pi);
		
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
	
	@RequestMapping("searchAdminNotice.ad")
	public ModelAndView noticeSearch(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String value, 
			@RequestParam("searchCondition") String condition, Board b, ModelAndView mv) {
		
		if(condition.equals("no")) {
			b.setbNo(Integer.parseInt(value));
		}
		else if(condition.equals("title")) {
			b.setbTitle(value);
		}
		else if(condition.equals("content")) {
			b.setbContent(value);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(!value.isEmpty()) {
			int listCount = adService.searchNoticeListCount(b);
			
			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
			
			ArrayList<MemberVO> list = adService.selectSearchNoticeResultList(b, pi);
			
			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue" , value).addObject("searchCondition", condition).setViewName("admin_notice/admin_Notice");
		}
		
		return mv;
	}
	
	@RequestMapping("adminEvent.ad")
	public ModelAndView adminEventList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = eService.getListCount();
		
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
		
		ArrayList<Event> elist = eService.selectAdminEventList(pi);
		
		if(elist != null) {
			mv.addObject("list", elist).addObject("pi", pi).setViewName("admin_event/admin_Event");
		} else { 
			throw new EventException("이벤트 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("searchAdminEvent.ad")
	public ModelAndView eventSearch(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String value, 
			@RequestParam("searchCondition") String condition, Event e, ModelAndView mv) {
		
		if(condition.equals("no")) {
			e.setEventNo(Integer.parseInt(value));
		}
		else if(condition.equals("title")) {
			e.setEventTitle(value);
		}
		else if(condition.equals("content")) {
			e.setEventContent(value);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(!value.isEmpty()) {
			int listCount = adService.searchEventListCount(e);
			
			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
			
			ArrayList<Event> list = adService.selectSearchEventResultList(e, pi);
			
			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue" , value).addObject("searchCondition", condition).setViewName("admin_event/admin_Event");
		}
		
		return mv;
	}
	
	@RequestMapping("evdelete.ad")
	public String deleteEvent(@RequestParam(value="check[]", required=false) String[] check){
		int result = 0;
		
		for(int i = 0; i <= check.length - 1; i++ ) {
			result = adService.deleteEvent(check[i]);
		}
		
		if(result > 0) {
			return "redirect:adminEvent.ad";
		} else {
			System.out.println("안됨");
			return null;
		}
	}
	
	@RequestMapping("adminSurvey.ad")
	public String adminSurveyList() {
		return "../admin/admin_member/admin_Member";
	}
	
	@RequestMapping("adminummerical.ad") 
	public String nummericalView() {
		return  "../admin/admin_nummerical/member_nummerical";
	}
	
}