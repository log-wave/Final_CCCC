package com.kh.Final_cccc.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

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
import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.admin.model.vo.Rank;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.service.BoardService;
import com.kh.Final_cccc.common.PagenationAdmin;
import com.kh.Final_cccc.material.model.service.MaterialService;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.speciality.model.vo.Speciality;
import com.kh.Final_cccc.speciality.service.SpecialityService;
import com.kh.Final_cccc.survey.model.vo.Survey;

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
	public ModelAndView adminMemberList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = adService.getMemberListCount();

		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<MemberVO> list = adService.selectMemberList(pi);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_member/admin_Member");
		} else {
			return null;
		}

		return mv;
	}

	@RequestMapping("memberDetailForm.ad")
	public String myInfoView(@RequestParam(value = "id") String id, Model model) {
		MemberVO member = adService.getMemberDetail(id);
		System.out.println(member);
		if (member != null) {
			model.addAttribute("m", member);
			return "admin_member/admin_mypage";
		} else {
			System.out.println("안됨");
			return null;
		}

	}

	@RequestMapping("updateMemberStatus.ad")
	public String updateMemberStatus(@RequestParam(value = "check[]", required = false) String[] check,
			@RequestParam(value = "status", required = false) String status, @ModelAttribute MemberVO m) {
		int result = 0;
		for (int i = 0; i <= check.length - 1; i++) {
			m.setUser_id(check[i]);
			m.setStatus(status);
			result = adService.getUpdateMemberStatus(m);
		}

		if (result > 0) {
			return "redirect:adminMember.ad";
		} else {
			System.out.println("안됨");
			return null;
		}
	}

	@RequestMapping("searchAdminMember.ad")
	public ModelAndView memberSearch(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("searchValue") String value, @RequestParam("searchCondition") String condition, MemberVO m,
			ModelAndView mv) {

		if (condition.equals("no")) {
			m.setUser_no(Integer.parseInt(value));
		} else if (condition.equals("id")) {
			m.setUser_id(value);
		} else if (condition.equals("nick")) {
			m.setNickname(value);
		} else if (condition.equals("state")) {
			m.setStatus(value);
		}

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		if (!value.isEmpty()) {
			int listCount = adService.searchMemberListCount(m);

			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

			ArrayList<MemberVO> list = adService.selectSearchMemberResultList(m, pi);

			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue", value)
					.addObject("searchCondition", condition).setViewName("admin_member/admin_Member");
		}

		return mv;
	}

	@RequestMapping("adminRecipe.ad")
	public ModelAndView adminRecipeList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = adService.getRecipeListCount();

		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<Recipe> list = adService.selectRecipeList(pi);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_recipe/admin_Recipe");
		} else {
			return null;
		}

		return mv;
	}

	@RequestMapping("adminMaterial.ad")
	public ModelAndView adminMaterialList(@RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = adService.getMateListCount();

		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<Material> list = adService.selectMateList(pi);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_material/admin_Material");
		} else {
			return null;
		}

		return mv;
	}

	@RequestMapping("materialDetailForm.ad")
	public String mateInfoView(@RequestParam(value = "no") int matrialNo, Model model) {
		Material material = maService.getMaterialDetail(matrialNo);

		if (material != null) {
			model.addAttribute("material", material);
			return "admin_material/admin_MaterialDetail";
		} else {
			System.out.println("재료 상세보기 실패");
			return null;
		}
	}

	@RequestMapping("insertMateForm.ad")
	public String admininsertmateForm() {
		return "../admin/admin_material/insertMateForm/insertmateForm";
	}

	@RequestMapping("adminSpeciality.ad")
	public ModelAndView adminSpecialityList(@RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = speService.getSpeListCount();
		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<Speciality> list = speService.selectSpeList(pi);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_speciality/admin_Speciality");
		} else {
			return null;
		}

		return mv;

	}

	@RequestMapping("adminQAboard.ad")
	public ModelAndView adminQAboardList(@RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = bService.getqListCount();

		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<Board> list = bService.selectAdminQList(pi);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_QA/admin_QA");
		} else {
			return null;
		}

		return mv;
	}

	@RequestMapping("qaDetailForm.ad")
	public String qaDetail(@RequestParam(value = "id") int id, Model model) {
		Board board = bService.selectqaBoard(id);

		if (board != null) {
			model.addAttribute("board", board);
			return "admin_QA/admin_qaDetail";
		} else {
			System.out.println("실패");
			return null;
		}
	}

	@RequestMapping("deleteAnswer.ad")
	public void deleteAnswer(@RequestParam("bNo") String bNo, HttpServletResponse response)
			throws JsonIOException, IOException {
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
	public ModelAndView QASearch(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("searchValue") String value, @RequestParam("searchCondition") String condition, Board b,
			ModelAndView mv) {

		if (condition.equals("no")) {
			b.setbNo(Integer.parseInt(value));
		} else if (condition.equals("title")) {
			b.setbTitle(value);
		} else if (condition.equals("content")) {
			b.setbContent(value);
		}

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		if (!value.isEmpty()) {
			int listCount = adService.searchQAListCount(b);

			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

			ArrayList<MemberVO> list = adService.selectSearchQAResultList(b, pi);

			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue", value)
					.addObject("searchCondition", condition).setViewName("admin_QA/admin_QA");
		}

		return mv;
	}

	@RequestMapping("adminBoard.ad")
	public ModelAndView adminBoardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = bService.getListCount();

		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<Board> list = bService.selectAdminList(pi);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_notice/admin_Notice");
		} else {
			return null;
		}

		return mv;
	}

	@RequestMapping("noticeDetailForm.ad")
	public String noticeDetail(@RequestParam(value = "id") int id, Model model) {
		Board board = bService.selectBoard(id);

		if (board != null) {
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
	public ModelAndView noticeSearch(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("searchValue") String value, @RequestParam("searchCondition") String condition, Board b,
			ModelAndView mv) {

		if (condition.equals("no")) {
			b.setbNo(Integer.parseInt(value));
		} else if (condition.equals("title")) {
			b.setbTitle(value);
		} else if (condition.equals("content")) {
			b.setbContent(value);
		}

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		if (!value.isEmpty()) {
			int listCount = adService.searchNoticeListCount(b);

			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

			ArrayList<MemberVO> list = adService.selectSearchNoticeResultList(b, pi);

			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue", value)
					.addObject("searchCondition", condition).setViewName("admin_notice/admin_Notice");
		}

		return mv;
	}

	@RequestMapping("adminEvent.ad")
	public ModelAndView adminEventList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = eService.getListCount();

		com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

		ArrayList<Event> elist = eService.selectAdminEventList(pi);

		if (elist != null) {
			mv.addObject("list", elist).addObject("pi", pi).setViewName("admin_event/admin_Event");
		} else {
			throw new EventException("이벤트 전체 조회에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("searchAdminEvent.ad")
	public ModelAndView eventSearch(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("searchValue") String value, @RequestParam("searchCondition") String condition, Event e,
			ModelAndView mv) {

		if (condition.equals("no")) {
			e.setEventNo(Integer.parseInt(value));
		} else if (condition.equals("title")) {
			e.setEventTitle(value);
		} else if (condition.equals("content")) {
			e.setEventContent(value);
		}

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		if (!value.isEmpty()) {
			int listCount = adService.searchEventListCount(e);

			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);

			ArrayList<Event> list = adService.selectSearchEventResultList(e, pi);

			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue", value)
					.addObject("searchCondition", condition).setViewName("admin_event/admin_Event");
		}

		return mv;
	}

	@RequestMapping("evdelete.ad")
	public String deleteEvent(@RequestParam(value = "check[]", required = false) String[] check) {
		int result = 0;

		for (int i = 0; i <= check.length - 1; i++) {
			result = adService.deleteEvent(check[i]);
		}

		if (result > 0) {
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
	public String nummericalView(Model model) {

		int woman = adService.WomanCount();
		String w = "여자";
		String result = "['" + w + "'," + woman + "]";
		model.addAttribute("result", result);

		int man = adService.manCount();
		String m = "남자";
		String result1 = "['" + m + "'," + man + "]";
		model.addAttribute("result1", result1);

		ArrayList<MemberVO> ag = adService.getmemberList();
		System.out.println(ag);

		HashMap<String, Integer> ageMap = new HashMap<String, Integer>();

		ArrayList<Integer> age1 = new ArrayList<Integer>();

		for (int i = 0; i < ag.size(); i++) {
			int age = Integer.parseInt((ag.get(i).getAge()));
			age1.add(age);
		}

		System.out.println(age1);

		int age10 = 0;
		int age20 = 0;
		int age30 = 0;
		int age40 = 0;
		int age50 = 0;

		for (int i = 0; i < age1.size(); i++) {
			if (10 <= age1.get(i) && age1.get(i) <= 19) {
				age10 += 1;
				ageMap.put("10대", age10);
			}
			if (20 <= age1.get(i) && age1.get(i) <= 29) {
				age20 += 1;
				ageMap.put("20대", age20);
			}
			if (30 <= age1.get(i) && age1.get(i) <= 39) {
				age30 += 1;
				ageMap.put("30대", age30);
			}
			if (40 <= age1.get(i) && age1.get(i) <= 49) {
				age40 += 1;
				ageMap.put("40대", age40);
			}
			if (50 <= age1.get(i)) {
				age50 += 1;
				ageMap.put("50대 이상", age50);
			}
		}
		System.out.println(ageMap);

		String result3 = "";
		for (String key : ageMap.keySet()) {
			if (result3 != "") {
				result3 += ",";
			}
			result3 += "['" + key + "', " + ageMap.get(key) + "]";

		}
		model.addAttribute("result3", result3);
		return "../admin/admin_nummerical/member_nummerical";
	}

	@RequestMapping("spe_nummerical.ad")
	public String spe_nummbericalView(Model model) {

		ArrayList<Rank> mateList = adService.getmateList();
		System.out.println(mateList);
		
		LinkedHashMap<String, Integer> mateMap = new LinkedHashMap<String, Integer>();

		for (int i = 0; i < mateList.size(); i++) {
			mateMap.put(mateList.get(i).getName(), mateList.get(i).getCount());
		}

		 String result =""; 
		  
		 for (String key : mateMap.keySet()) {
			  if(result!="") { 
				  result+= ","; 
			  } result += "['" + key + "', " + mateMap.get(key) + "]";
		  }
		  System.out.println(result);
		  model.addAttribute("result", result);
		 
		  
		ArrayList<Rank> speList = adService.getspeList();
		
		LinkedHashMap<String, Integer> speMap = new LinkedHashMap<String, Integer>();
		
		for (int i = 0; i < speList.size(); i++) {
			speMap.put(speList.get(i).getName(), speList.get(i).getCount());
		}
		System.out.println(speMap);
		
		 String result2 =""; 
		  
		 for (String key : speMap.keySet()) {
				  if(result2!="") { 
					  result2+= ","; 
				  } result2 += "['" + key + "', " + speMap.get(key) + "]";
			  }
			  System.out.println(result2);
			  model.addAttribute("result2", result2);
		  
		ArrayList<Integer> createDate = adService.getDateCount();
		System.out.println("createDate"  + createDate);
		
	int m1 = 0; int m2 = 0; int m3 = 0; int m4 = 0; int m5 = 0;
	int m6 = 0; int m7 = 0; int m8 = 0; int m9 = 0; int m10 = 0; 
	int m11 = 0; int m12 = 0; 
	 
	LinkedHashMap<String, Integer> month = new LinkedHashMap<String, Integer>();
	
	for(int i = 0; i < createDate.size(); i++) {
			if(createDate.get(i) == 1) {
				m1 += 1; month.put("1", m1 );
			}else{m1 += 0; month.put("1", m1 );
			
			}if(createDate.get(i) == 2) {
				m2 += 1; month.put("2", m2 );
			}else {m2 += 0; month.put("2", m2 );	
			
			}if(createDate.get(i) == 3) {
				m3 += 1; month.put("3", m3 );
			}else {m3 += 0; month.put("3", m3 );
			
			}if(createDate.get(i) == 4) {
				m4 += 1; month.put("4", m4 );
			}else {m4 += 0; month.put("4", m4 );
			
			} if(createDate.get(i) == 5) {
				m5 += 1; month.put("5", m5 );
			}else { m5 += 0; month.put("5", m5 );
			
			}if(createDate.get(i) == 6) {
				m6 += 1;month.put("6", m6 );
			}else {m6 += 0;month.put("6", m6 );
			
			} if(createDate.get(i) == 7) {
				m7 += 1;month.put("7", m7 );
			}else {
				m7 += 0;month.put("7", m7 );
			}if(createDate.get(i) == 8) {
				m8 += 1; month.put("8", m8 );
			}else {
				m8 += 0; month.put("8", m8 );
			}if(createDate.get(i) == 9) {
				m9 += 1; month.put("9", m9 );
			}else {
				m9 += 0; month.put("9", m9 );
			}if(createDate.get(i) == 10) {
				m10 += 1; month.put("10", m10 );
			}else {
				m10 += 0; month.put("10", m10 );
			}
			if(createDate.get(i) == 11) {
				m11 += 1; month.put("11", m11 );
			}else {
				m11 += 0; month.put("11", m11 );
			}
			if(createDate.get(i) == 12) {
				m12 += 1;month.put("12", m12 );
			} else {
				m12 += 0;month.put("12", m12 );
			}
			
	}
		System.out.println(month);
		
		String result3 = "";
		for (String key : month.keySet()) {
			if (result3 != "") {
				result3 += ",";
			}
			result3 += "['" + key + "', " + month.get(key) + "]";
	
		}
	
		model.addAttribute("result3", result3);
		
		return "../admin/admin_nummerical/spe_nummerical";
	}

	
	@RequestMapping("survey_nummerical.ad")
	public String survey_nummericalView(Model model) {

		ArrayList<Survey> survey = adService.getSurveyList();
		System.out.println(survey);

		HashMap<String, Integer> svMap = new HashMap<String, Integer>();

		ArrayList<String> sv1 = new ArrayList<String>();

		for (int i = 0; i < survey.size(); i++) {
			String svAn1 = survey.get(i).getSurvey_one();
			sv1.add(svAn1);
		}

		System.out.println(sv1);

		int svA1 = 0;
		int svA2 = 0;
		int svA3 = 0;
		int svA4 = 0;

		for (int i = 0; i < sv1.size(); i++) {
			if (sv1.get(i).contains("자주 먹는다")) {
				svA1 += 1;
				svMap.put("자주 먹는다", svA1);
			} else {
				svA2 += 0;
				svMap.put("거의 안먹는다", svA3);
			}
			if (sv1.get(i).contains("가끔 먹는다")) {
				svA2 += 1;
				svMap.put("가끔 먹는다", svA2);
			} else {
				svA2 += 0;
				svMap.put("거의 안먹는다", svA3);
			}
			if (sv1.get(i).contains("거의 안먹는다")) {
				svA3 += 1;
				svMap.put("거의 안먹는다", svA3);
			} else {
				svA3 += 0;
				svMap.put("거의 안먹는다", svA3);
			}

			if (sv1.get(i).contains("안먹는다")) {
				svA4 += 1;
				svMap.put("안먹는다", svA4);
			} else {
				svA4 += 0;
				svMap.put("안먹는다", svA4);
			}
		}
		System.out.println(svMap);
		String result = "";
		for (String key : svMap.keySet()) {
			if (result != "") {
				result += ",";
			}
			result += "['" + key + "', " + svMap.get(key) + "]";

		}

		model.addAttribute("result", result);

		HashMap<String, Integer> svMap2 = new HashMap<String, Integer>();

		ArrayList<String> sv2 = new ArrayList<String>();

		for (int i = 0; i < survey.size(); i++) {
			String svAn2 = survey.get(i).getSurvey_two();
			sv2.add(svAn2);
		}

		System.out.println(sv2);

		int svA21 = 0;
		int svA22 = 0;
		int svA23 = 0;
		int svA24 = 0;

		for (int i = 0; i < sv2.size(); i++) {
			if (sv2.get(i).contains("아주 좋아한다")) {
				svA21 += 1;
				svMap2.put("아주 좋아한다", svA21);
			} else {
				svA21 += 0;
				svMap2.put("아주 좋아한다", svA21);
			}
			if (sv2.get(i).contains("좋아한다")) {
				svA22 += 1;
				svMap2.put("좋아한다", svA22);
			} else {
				svA22 += 0;
				svMap.put("좋아한다", svA22);
			}
			if (sv2.get(i).contains("보통이다")) {
				svA23 += 1;
				svMap2.put("보통이다", svA23);
			} else {
				svA23 += 0;
				svMap2.put("보통이다", svA23);
			}

			if (sv2.get(i).contains("싫어한다")) {
				svA24 += 1;
				svMap2.put("싫어한다", svA24);
			} else {
				svA24 += 0;
				svMap2.put("싫어한다", svA24);
			}
		}
		System.out.println(svMap2);
		String result2 = "";
		for (String key : svMap2.keySet()) {
			if (result2 != "") {
				result2 += ",";
			}
			result2 += "['" + key + "', " + svMap2.get(key) + "]";

		}
		model.addAttribute("result2", result2);

		HashMap<String, Integer> svMap3 = new HashMap<String, Integer>();

		ArrayList<String> sv3 = new ArrayList<String>();

		for (int i = 0; i < survey.size(); i++) {
			String svAn3 = survey.get(i).getSurvey_three();
			sv3.add(svAn3);
		}

		System.out.println(sv3);

		int svA31 = 0;
		int svA32 = 0;
		int svA33 = 0;
		int svA34 = 0;

		for (int i = 0; i < sv3.size(); i++) {
			if (sv3.get(i).contains("3회 이상")) {
				svA31 += 1;
				svMap3.put("3회 이상", svA31);
			} else {
				svA31 += 0;
				svMap3.put("3회 이상", svA31);
			}
			if (sv3.get(i).contains("2회")) {
				svA32 += 1;
				svMap3.put("2회", svA32);
			} else {
				svA32 += 0;
				svMap3.put("2회", svA32);
			}
			if (sv3.get(i).contains("1회")) {
				svA33 += 1;
				svMap3.put("1회", svA33);
			} else {
				svA33 += 0;
				svMap3.put("1회", svA33);
			}

			if (sv3.get(i).contains("0회")) {
				svA34 += 1;
				svMap3.put("0회", svA34);
			} else {
				svA34 += 0;
				svMap3.put("0회", svA34);
			}
		}
		System.out.println(svMap3);
		String result3 = "";
		for (String key : svMap3.keySet()) {
			if (result3 != "") {
				result3 += ",";
			}
			result3 += "['" + key + "', " + svMap3.get(key) + "]";

		}
		model.addAttribute("result3", result3);

		HashMap<String, Integer> svMap4 = new HashMap<String, Integer>();

		ArrayList<String> sv4 = new ArrayList<String>();

		for (int i = 0; i < survey.size(); i++) {
			String svAn4 = survey.get(i).getSurvey_four();
			sv4.add(svAn4);
		}

		System.out.println(sv4);

		int svA41 = 0; int svA42 = 0; int svA43 = 0; int svA44 = 0;

		for (int i = 0; i < sv4.size(); i++) {
			if (sv4.get(i).contains("네 끼 이상")) {
				svA41 += 1;
				svMap4.put("네 끼 이상", svA41);
			} else {
				svA41 += 0;
				svMap4.put("네 끼 이상", svA41);
			}
			if (sv4.get(i).contains("세 끼")) {
				svA42 += 1;
				svMap4.put("세 끼", svA42);
			} else {
				svA42 += 0;
				svMap4.put("세 끼", svA42);
			}
			if (sv4.get(i).contains("두 끼")) {
				svA43 += 1;
				svMap4.put("두 끼", svA43);
			} else {
				svA43 += 0;
				svMap4.put("두 끼", svA43);
			}

			if (sv4.get(i).contains("한 끼")) {
				svA44 += 1;
				svMap4.put("한 끼", svA44);
			} else {
				svA44 += 0;
				svMap4.put("한 끼", svA44);
			}
		}
		System.out.println(svMap4);
		String result4 = "";
		for (String key : svMap4.keySet()) {
			if (result4 != "") {
				result4 += ",";
			}
			result4 += "['" + key + "', " + svMap4.get(key) + "]";

		}
		model.addAttribute("result4", result4);

		HashMap<String, Integer> svMap5 = new HashMap<String, Integer>();

		ArrayList<String> sv5 = new ArrayList<String>();

		for (int i = 0; i < survey.size(); i++) {
			String svAn5 = survey.get(i).getSurvey_five();
			sv5.add(svAn5);
		}

		System.out.println(sv5);

		int svA51 = 0;
		int svA52 = 0;
		int svA53 = 0;
		int svA54 = 0;

		for (int i = 0; i < sv5.size(); i++) {
			if (sv5.get(i).contains("매우 도움됨")) {
				svA51 += 1;
				svMap5.put("매우 도움됨", svA51);
			} else {
				svA51 += 0;
				svMap5.put("매우 도움됨", svA51);
			}
			if (sv5.get(i).contains("도움이 됨")) {
				svA52 += 1;
				svMap5.put("도움이 됨", svA52);
			} else {
				svA52 += 0;
				svMap5.put("도움이 됨", svA52);
			}
			if (sv5.get(i).contains("보통")) {
				svA53 += 1;
				svMap5.put("보통", svA53);
			} else {
				svA53 += 0;
				svMap5.put("보통 ", svA53);
			}
			if (sv5.get(i).contains("도움이 안됨")) {
				svA54 += 1;
				svMap5.put("도움이 안됨", svA54);
			} else {
				svA54 += 0;
				svMap5.put("도움이 안됨", svA54);
			}
		}
		System.out.println(svMap5);
		String result5 = "";
		for (String key : svMap5.keySet()) {
			if (result5 != "") {
				result5 += ",";
			}
			result5 += "['" + key + "', " + svMap5.get(key) + "]";

		}
		model.addAttribute("result5", result5);
		return "../admin/admin_nummerical/survey_nummerical";
	}	

}