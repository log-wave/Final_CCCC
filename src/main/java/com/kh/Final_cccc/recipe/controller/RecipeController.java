package com.kh.Final_cccc.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.Final_cccc.Event.exception.EventException;
import com.kh.Final_cccc.Files.service.FilesService;
import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.common.PagenationRecipe;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.recipe.model.service.RecipeService;
import com.kh.Final_cccc.recipe.model.vo.PageInfo;
import com.kh.Final_cccc.recipe.model.vo.ReMaterial;
import com.kh.Final_cccc.recipe.model.vo.Recipe;
import com.kh.Final_cccc.recipe.model.vo.RecipeProcess;
import com.kh.Final_cccc.recipe.model.vo.Recipe_spec;
import com.kh.Final_cccc.recipe.model.vo.Reply;
import com.kh.Final_cccc.recipe.model.vo.Scrap;
import com.kh.Final_cccc.speciality.model.vo.Speciality;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService rService;
	
	@Autowired
	private FilesService fService;
	
	@RequestMapping("RList.rp")
	public ModelAndView RecipeList(@RequestParam(value="page" , required= false)Integer page,
			@RequestParam("sort_no") int sort_no, @RequestParam("type") int type,
			ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = rService.getListCount();
		PageInfo pi = PagenationRecipe.getPageInfo(currentPage, listCount);
		ArrayList<Recipe> rList = null;
		ArrayList<Files> fList = null;
		switch(type) {
		case 1: {
			rList = rService.selectsubList(sort_no, pi);
			fList = fService.selectsubfileList(sort_no, pi);
			break;
			}
		case 2: {
			rList = rService.selectmateList(sort_no, pi);
			fList = fService.selectmatefileList(sort_no, pi);
			break;
			}
		case 3: {
			rList = rService.selectspecList(sort_no, pi);
			fList = fService.selectspecfileList(sort_no, pi);
			break;
			}
		}
		
		System.out.println("r :" + rList);
		System.out.println("f : "+fList);
		if(rList != null) {
			mv.addObject("rList", rList).addObject("type",type).addObject("sort_no", sort_no).addObject("fList",fList).addObject("pi", pi).setViewName("/searchRecipe/searchRecipe");
		}
		return mv;
	}
	
	@RequestMapping("rDetail.rp")
	public String RecipeList(@RequestParam("recipeNo") int recipeNo, Model model) {
		
		
		//
		
		//레시피 개요
		Recipe r_info = rService.selectRecipe(recipeNo);
		//재료정보(영양정보& 재료목록)
		ArrayList<ReMaterial> r_mate = rService.selectrMate(recipeNo);
		//조리과정
		ArrayList<RecipeProcess> r_process = rService.selectProcess(recipeNo);
		//파일정보 : 조리과정 파일은 조리과정과 함께 가져와야함
		//1.썸네일
		Files rp_thum = fService.selectRTFiles(recipeNo);
		//2. 조리과정
		ArrayList<Files> rp_files = fService.selectRFiles(recipeNo);
		//회원정보 고민해볼것
		//이름
		String name = rService.selectUserName(r_info.getUser_no());
		System.out.println(name);
		//프로필 사진
		Files profile = rService.selectprofile(r_info.getUser_no());
		
		System.out.println("썸네일" + rp_thum.getFileName());
		for(int i = 0; i < rp_files.size(); i++) {
			System.out.println("조리과정" + i+1 + ": " + rp_files.get(i).getFileName());
		}
		
		String spec_info = rService.selectspecinfo(recipeNo);
		
		//
		Recipe_spec rs_original=  rService.selectSpec(recipeNo);
		HashMap rs = new HashMap();
		if(rs_original != null) {
			rs.put("spec_name", rService.selectSpecname(rs_original.getSpeciality_no(), recipeNo));
			rs.put("per_qnt", rs_original.getPer_qnt());
		}
		
	
		//영양정보  계산하기 + 재료의 수량만큼 늘어나는 로직 하나 더 짜야함
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
		
		int result = rService.increViewCount(recipeNo);
		model.addAttribute("rs", rs).addAttribute("r_info", r_info).
			addAttribute("nickname", name).addAttribute("r_mate",r_mate).
			addAttribute("r_process", r_process).addAttribute("nutArr", nutlist).
			addAttribute("rp_files", rp_files).addAttribute("rp_thum", rp_thum).
			addAttribute("spec_info", spec_info).addAttribute("profile",profile);
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
	
	@RequestMapping("SList.rp")
	@ResponseBody
	public void SpecList(@RequestParam("sNo")String sNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Speciality> sList = rService.selectSpecialityList(sNo);
		
		new GsonBuilder().create().toJson(sList, response.getWriter());
	}
	
	@RequestMapping("Sinfo.rp")
	@ResponseBody
	public void getSpecinfo(@RequestParam("sNo") int sNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		
		String sInfo = rService.getSpecinfo(sNo);
		
		new GsonBuilder().create().toJson(sInfo, response.getWriter());
	}
	
	@RequestMapping("insertRecipe.rp")
	public String insertRecipe(HttpServletRequest request, @ModelAttribute Recipe recipe,
			MultipartHttpServletRequest request2, @RequestParam("RecipeImg") MultipartFile[] recipeImg,
			@RequestParam("recipe_thum") MultipartFile recipe_thum,
			@RequestParam(value="specsecCate" , required= false) int spec_no,
			@RequestParam(value="spec_qnt" , required= false) int spec_qnt) {
		
		//파일 기본조건
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		//디렉토리가 없다면 디렉토리 생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		//1. 레시피(메인) 추가
		System.out.println(recipe);
		int result_1 = rService.insertRecipe(recipe);
		
		
		//날짜를 원하는 형태로 출력 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHssSSS");
		ArrayList<String> originFileName = new ArrayList<String>(); 
		ArrayList<String> renameFileName = new ArrayList<String>();
		ArrayList<String > renamePath = new ArrayList<String>();
		
		//추가된 재료 배열과 재료에 맞는 양
		String[] mNoArr = request.getParameterValues("rp_mate");
		String[] mAmArr = request.getParameterValues("mate_amount");
		for(int i = 0; i < mNoArr.length; i++) {
			System.out.println("번호 : "+mNoArr[i] + "/ 재료양 : " + mAmArr[i]);
			int material_no = Integer.parseInt(mNoArr[i]);
			int per_qnt = Integer.parseInt(mAmArr[i]);
			ReMaterial mate = new ReMaterial(material_no, per_qnt);
			int result_2 = rService.insertRecipemate(mate);
			//한번씩 메소드를 호출해서 보내줘야
		}
		
		
		//특산물
		
		if(!(spec_no == 0 && spec_qnt == 0)) {
			Recipe_spec rs = new Recipe_spec(spec_no, spec_qnt);
			int result = rService.insertrecipeSpec(rs);
		}
		
		//썸네일 기능
		String originalthumName = recipe_thum.getOriginalFilename();
		String renamethumName = sdf.format(new Date(System.currentTimeMillis()))+ originalthumName.substring(originalthumName.lastIndexOf("."));
		String renamethumPath = folder + "/" + renamethumName;
		try {
			recipe_thum.transferTo(new File(renamethumPath));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Files f_t = new Files();
		f_t.setFilePath(savePath);
		f_t.setFileName(originalthumName);
		f_t.setChangeName(renamethumName);
		f_t.setFileYn("Y");
		int tresult = fService.insertRTFiles(f_t);
		//조리과정		
		for(int i = 0; i < recipeImg.length; i++) {
			 originFileName.add(recipeImg[i].getOriginalFilename());
			 renameFileName.add(sdf.format(new Date(System.currentTimeMillis()))+ originFileName.get(i).substring(originFileName.lastIndexOf(".") + 1));
			 renamePath.add(folder +"/"+ renameFileName.get(i));
			 
			 try {
				 // MultipartFile로 받은 파일을 transferTo( ) 함수를 통해 renamePath()경로에  저장
				recipeImg[i].transferTo(new File(renamePath.get(i)));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(originFileName);
		String[] pr_Content = request.getParameterValues("rp_content");
		
		ArrayList<Files> fileList = new ArrayList<Files>();
		
		for(int i = 0; i <= originFileName.size()-1; i++) {
			Files f = new Files();
			f.setFilePath(savePath);
			
			f.setFileName(originFileName.get(i));
			f.setChangeName(renameFileName.get(i));

			
			f.setFileYn("N");
			
			System.out.println("f" + f);
			int result_3 = rService.insertRecipeProcess(pr_Content[i]);
			int fresult = fService.insertRFiles(f);
			
			if(fresult == 0) {
				System.out.println("이벤트이미지 에러남");
				throw new EventException("이벤트 상세 조회에 실패하였습니다.");
			}
		
		}
		
		//result1,2,3이 null이면 에러페이지로 이동하는 메소드 작성해야함
		return "redirect:index.jsp";
	}
	
	//댓글관련
	@RequestMapping("addReply.rp")
	@ResponseBody
	public String insertReply(@RequestParam("rContent") String rContent, @RequestParam("refRid") int refRid,
			HttpSession session) {
		
		int reply_writer = ((MemberVO)session.getAttribute("loginUser")).getUser_no();
		
		JSONObject jobj = new JSONObject();
		
		Reply reply = new Reply(rContent, reply_writer, refRid);
		
		int result = rService.insertReply(reply);
		
		if(result > 0) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("repList.rp")
	@ResponseBody
	public void selectReply(@RequestParam("rId") int rId, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Reply> RepList = rService.selectReplyList(rId);
		
		response.setContentType("application/json;charset=utf-8");
//		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		
		gson.toJson(RepList, response.getWriter());
	}
	
	@RequestMapping("setScrapbtn.rp")
	@ResponseBody
	public String setScrapbtn(@RequestParam("rId") int rId, HttpSession session) {
		int user_no = ((MemberVO)session.getAttribute("loginUser")).getUser_no();
		Scrap s = new Scrap(rId, user_no);
		System.out.println(s);
		int result = rService.selectScrapcheck(s);
		String return_result = null;
		if(result ==1) {
			return_result= "1"; 
		}else {
			return_result= "0";
		}
		return return_result;
	}
	
	@RequestMapping("enterScrap.rp")
	@ResponseBody
	public String enterScrap(@RequestParam("rId") int rId, HttpSession session) {
		int user_no = ((MemberVO)session.getAttribute("loginUser")).getUser_no();
		Scrap s = new Scrap(rId, user_no);
		
		int result = rService.insertScrap(s);
		if(result == 1) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("cancelScrap.rp")
	@ResponseBody
	public String cancelScrap(@RequestParam("rId") int rId, HttpSession session) {
		int user_no = ((MemberVO)session.getAttribute("loginUser")).getUser_no();
		Scrap s = new Scrap(rId, user_no);
		
		int result = rService.deleteScrap(s);
		
		if(result == 1) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("Recipedelete.rp")
	@ResponseBody
	public String deleteRecipe(@RequestParam("rId") int rId) {
		int result = rService.deleteRecipe(rId);
		if(result == 1) {
			return "success";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("materialSelectRecipe.rp")
	public ModelAndView mateSelectRecipe(@RequestParam("mateArr") String[] mateArr, @RequestParam(value="page", required= false) Integer page, 
			ModelAndView mv) {
		
		ArrayList<Recipe> rList = null;
		ArrayList<Recipe> jspList = new ArrayList<>();
		ArrayList<Files> fList = new ArrayList<>();
		
		int listCount = rService.getListCount();
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		PageInfo pi = PagenationRecipe.getPageInfo(currentPage, listCount);
			
		for(int i = 0; i < mateArr.length; i++) {
			rList = rService.mateSelectRecipeList(mateArr[i], pi);
			for(int j = 0; j < rList.size(); j++) {
				jspList.add(rList.get(j));
			}
			if(rList.isEmpty()) {
			}
		}
		
		for(int i = 0; i < jspList.size(); i++) {
			fList.add(fService.selectRTFiles(jspList.get(i).getRecipe_no()));
		}
				
		if(!rList.equals(null)) {
			mv.addObject("rList", jspList).addObject("fList", fList).addObject("pi", pi).setViewName("/searchRecipe/mateSearchRecipe");
		}else {
		}
		return mv;
	}
	
	
	@RequestMapping("mainPopularRecipe.rp") 
	@ResponseBody
	public void mainPopularRecipe( HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Recipe> rlist = rService.mainPopularRecipe();
		ArrayList<Files> flist = rService.mainPopularRecipeFiles();
		
		ArrayList<Integer> userNo = new ArrayList<Integer>();
		JSONArray jArray = new JSONArray();
		JSONObject jQbject = null;
		
		for(Recipe recipe : rlist  ) {
			for(Files fileinfo : flist) {
		         if(fileinfo.getRefNo() == recipe.getRecipe_no()) {
		         userNo.add(recipe.getUser_no());
		        jQbject = new JSONObject();
				jQbject.put("rTitle", recipe.getRecipe_title());
				jQbject.put("rexplain", recipe.getRecipe_explain());
				jQbject.put("file", fileinfo.getChangeName());
				jQbject.put("rNo", recipe.getRecipe_no());
				jQbject.put("cookingtime", recipe.getCooking_time());
				jArray.add(jQbject);
		        }
			}
		}
		System.out.println(userNo);
		
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(jArray, response.getWriter());
	}
	
	@RequestMapping("mainSpecialityRecipe.rp") 
	@ResponseBody
	public void mainSpecialityRecipe( HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Recipe> rlist = rService.mainSpecialityRecipe();
		ArrayList<Files> flist = rService.mainSpecialityRecipeFiles();
		
		JSONArray jArray = new JSONArray();
		JSONObject jQbject = null;
		
		for(Recipe recipe : rlist  ) {
			for(Files fileinfo : flist) {
		         if(fileinfo.getRefNo() == recipe.getRecipe_no()) {
			        jQbject = new JSONObject();
					jQbject.put("rTitle", recipe.getRecipe_title());
					jQbject.put("rexplain", recipe.getRecipe_explain());
					jQbject.put("file", fileinfo.getChangeName());
					jQbject.put("rNo", recipe.getRecipe_no());
					jQbject.put("userNo", recipe.getUser_no());
					jQbject.put("cookingtime", recipe.getCooking_time());
					jArray.add(jQbject);
		         }
			}
	}
		
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(jArray, response.getWriter());
	}
	
	@RequestMapping("searchMate.rp") 
	@ResponseBody
	public void searchMaterial(HttpServletResponse response, @RequestParam("sv") String sv) throws JsonIOException, IOException {
		
		ArrayList<Material> mList = rService.selectSearchMaterialList(sv);
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(mList, response.getWriter());
	}
	
	@RequestMapping("searchRecipeKey.rp")
	public ModelAndView searchRecipeKey(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("searchValue") String value, @RequestParam("searchCondition") String condition,
			ModelAndView mv) {
		
		HashMap sc = new HashMap();
		ArrayList<Files> fList = new ArrayList<>();
		
		int listCount = rService.getListCount();
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		PageInfo pi = PagenationRecipe.getPageInfo(currentPage, listCount);
		
		if (condition.equals("recipe1")) {
			sc.put("condition", 1);
		} else if (condition.equals("recipe2")) {
			sc.put("condition", 2);
		}
		sc.put("svalue", value);
		
		ArrayList<Recipe> rList = rService.selectSearchKeyword(sc, pi);
		
		for(int i = 0; i < rList.size(); i++) {
			fList.add(fService.selectRTFiles(rList.get(i).getRecipe_no()));
		}
		
		if (!rList.isEmpty() && !fList.isEmpty()) {
			mv.addObject("rList", rList).addObject("fList", fList).addObject("pi", pi).setViewName("/searchRecipe/mateSearchRecipe");
		} else {
			mv.addObject("rList", rList).addObject("fList", fList).addObject("pi", pi).setViewName("/searchRecipe/mateSearchRecipe");
		}
		
		return mv;
	}
	
	
}

