package com.kh.Final_cccc.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.member.common.PaginationMember;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.member.model.vo.PageInfo;
import com.kh.Final_cccc.member.service.MemberService;
import com.kh.Final_cccc.recipe.model.vo.Recipe;



/**
 * MVC 패턴에서 사용자로부터의 입력에 대한 응답으로 Model / View 를 업데이트하는 로직으로 구성되어 있는 Member 전용 클래스 
 *
 * @author 임 종 부 
 * @version 1.0
 * @see "MemberVO"
 * @see "MemberService"
 * @see "MemberServiceImpl"
 * @see "member-mapper.xml" 
 */

@SessionAttributes("loginUser")
@Controller 
public class MemberController {
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   private MemberService mService;
   
   @Inject
   PasswordEncoder passwordEncoder;
   
   
   //로그인 패이지로 이동 
   @RequestMapping(value="loginPage.me", method=RequestMethod.GET)
   public String login(HttpServletRequest request) {
      
      return "login/login";
   }
   
   
// 마이페이지 넘어가면서 마이레시피 불러오기
   @RequestMapping(value="myPage.me", method=RequestMethod.GET)
   public ModelAndView moveMyPage(@RequestParam(value="page" , required= false)Integer page, ModelAndView mv, HttpSession session) {
	     
         int user_no = ((MemberVO)session.getAttribute("loginUser")).getUser_no();
         System.out.println("유저 번호~~~" + user_no);
         int size = mService.selectScrapcount(user_no);
         int size1 = mService.selectMyRecipecount(user_no);
         int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mService.getListCount();
      PageInfo pi = PaginationMember.getPageInfo(currentPage, listCount);
      ArrayList<Recipe> rList = null;
      ArrayList<Files> fList = null;
      
      rList = mService.selectmrList(pi, user_no);
      fList = mService.selectmrfileList(pi, user_no);
      
      System.out.println("알리스트~~~~~~~~~~~~~~~~~~" + rList);
      System.out.println("에프리스트~~~~~~~~~~~~~~~~~" + fList);
      if(rList != null) {
         mv.addObject("rList", rList).addObject("fList",fList).addObject("pi", pi).addObject("size", size).addObject("size1", size1).setViewName("/myPage/MyPage");
      }
      return mv;
   }
   
   // 마이페이지 스크랩 불러오기
   
   @RequestMapping(value="Scrap.me", method=RequestMethod.GET)
   public ModelAndView moveScrap(@RequestParam(value="page" , required= false)Integer page, ModelAndView mv, HttpSession session) {
	   	  	 
         int user_no = ((MemberVO)session.getAttribute("loginUser")).getUser_no();
         System.out.println("유저 번호~~~" + user_no);
         int size = mService.selectMyRecipecount(user_no);
         int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mService.getListCountt();
      PageInfo pi = PaginationMember.getPageInfo(currentPage, listCount);
      ArrayList<Recipe> rListt = null;
      ArrayList<Files> fListt = null;
      
      rListt = mService.selectmrListt(pi, user_no);
      fListt = mService.selectmrfileListt(pi, user_no);
      
      System.out.println("스크랩~~~~~~~~알리스트~~~~~~~" + rListt);
      System.out.println("스크랩~~~~~~~~에프리스트~~~~~~" + fListt);
      if(rListt != null) {
         mv.addObject("rListt", rListt).addObject("fListt",fListt).addObject("pi", pi).addObject("size", size).setViewName("/myPage/Scrap");
      }
      return mv;
   }
   
   //회원탈퇴 약관 페이지로 이동 
   @RequestMapping(value="withdrawalGuide.me", method=RequestMethod.GET)
   public String moveWithdrawalGuide(HttpServletRequest request) {

      return "myPage/withdrawalGuide";
   }   
   
   
   //회원탈퇴 페이지로 이동 
   @RequestMapping(value="deleteMemberPage.me", method=RequestMethod.GET)
   public String movDeleteMemberPage(HttpServletRequest request) {

      return "deleteMember/deleteMember";
   }
   
   
   
   //인덱스 페이지로 이동 
   @RequestMapping(value="backIndex.do", method=RequestMethod.GET)
   public String backIndex(HttpServletRequest reques) {
      
      System.out.println("인덱스 페이지로 이동");
      
      
      return "index";
   }
   
   //관리자 페이지로 이동 
   @RequestMapping(value="adminPage.me", method=RequestMethod.GET)
   public String adminPage(HttpServletRequest reques) {
      
      System.out.println("관리자 페이지로 이동");
      
      
      return "redirect:adminMember.ad";    
   }
   
   
   //로그아웃 페이지로 이동 
   @RequestMapping(value="logoutPage.me")
   public String logoutPage(HttpSession session,SessionStatus status) {
      
   
      session.invalidate();
      status.setComplete();
      
      System.out.println("setComplete가 실행된 후의 세션값 유무 확인");
      
      
      return "redirect:backIndex.do"; 
   }
   
   
   
   
   

   //회원가입 약관 페이지로 이동 
   @RequestMapping(value="insertMemberTerms.me", method=RequestMethod.GET)
   public String insertMemberTermsPage(HttpServletRequest request) {
      
      return "insertMember/insertMemberTerms";
   }
   
   //회원가입 페이지로 이동 
   @RequestMapping(value="insertMemberForm.me", method=RequestMethod.GET)
   public String insertMemberForm(HttpServletRequest request) {
      
      return "insertMember/InsertMember";
   }
   
 //종부 로그인 디코딩 비교 
   @RequestMapping(value="loginCheck.me", method=RequestMethod.POST)
   @ResponseBody
   public int loginCheck(MemberVO m, Model model, @RequestParam("user_id") String user_id) {
      
	  String rawPw = m.getUser_password();
	  System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + rawPw);
	  String encPw = mService.select_userPw(m);
	  System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" +encPw);

	  String result = mService.checkstatus(user_id);
	  
	  System.out.println("status result : " + result);
	  
	  MemberVO loginUser = mService.loginCheck(m);
	  
	  if(result.equals("N")) {
      
		  return -2;
	
	  }else {
		  if(passwordEncoder.matches(rawPw, encPw)) {
			  
				 
			  
			  if(loginUser.getAuthority().equals("Y")) {
		            model.addAttribute("loginUser", loginUser);
		            return 1; //관리자 
		         }else {
		            model.addAttribute("loginUser", loginUser);
		            return 0; //사용자 
		         }
		  }else {
			  
			  return -1; // 로그인 /비밀번호 실패
			  
		  }
	  }
   }
   
   
   // id 중복 체크 컨트롤러
   @RequestMapping(value = "idCheck.me", method = RequestMethod.GET)
   @ResponseBody
   public int idCheck(@RequestParam("user_id") String user_id) {

      return mService.userIdCheck(user_id);
   }
   
   // 닉네임 중복 체크 컨트롤러
   @RequestMapping(value = "nickNameCheck.me", method = RequestMethod.GET)
   @ResponseBody
   public int nickNameCheck(@RequestParam("nickName") String nickName) {

      return mService.nickNameCheck(nickName);
   }
   
   
   //회원가입 컨트롤러 
    @RequestMapping(value = "insertUser.me", method = RequestMethod.POST)
    public String insertMember(@ModelAttribute MemberVO m ,@RequestParam("yy")String age,@RequestParam("user_password")String user_password ) {

        logger.info("회원가입 컨트롤러 진입");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        m.setAge(Integer.toString(year - Integer.parseInt(age) + 1));
        
        String encPassword = passwordEncoder.encode(user_password);
        m.setUser_password(encPassword);
        
        System.out.println(m);

        mService.insertMember(m);


        return "redirect:backIndex.do";


    }
   
   //회원탈퇴 체크 컨트롤러 
   
    @RequestMapping(value="deleteMemberCheck.me", method=RequestMethod.POST)
    @ResponseBody
    public int deleteMemberCheck(MemberVO m, Model model,SessionStatus status ){

       logger.info("회원 탈퇴 체크 컨트롤러 진입");
       String rawPw = m.getUser_password();
       System.out.println(rawPw);

       String encPw = mService.select_userPw(m);

       if(passwordEncoder.matches(rawPw, encPw)) {

           status.setComplete();
           int result = mService.deleteMemberCheck(m);
           System.out.println(result);
           return 1;
       }

       return -1;


    }
   
   //회원탈퇴 pass_cnt 카운트 검사 컨트롤러
   @RequestMapping(value="count_DeleteMemberCheck_Num.me", method=RequestMethod.POST)
   @ResponseBody
   public int count_DeleteMemberCheck_Num(MemberVO m, Model model ){
      
      logger.info("회원 탈퇴 카운트 검사 컨트롤러 진입");
      
      System.out.println(m.getUser_id());
      System.out.println(m.getUser_password());
      System.out.println(m);
      int result = mService.count_DeleteMemberCheck_Num(m);
      System.out.println("회원탈퇴 카운트 검사  결과 " + result);
      return result;
   }   
   
   
   //회원탈퇴 pass_cnt 카운트 누적 컨트롤러
   @RequestMapping(value="pass_cnt.me", method=RequestMethod.POST)
   @ResponseBody
   public int count_pass_cnt(MemberVO m, Model model ){
      
      logger.info("회원 탈퇴 카운트 컨트롤러 진입");
      
      System.out.println(m.getUser_id());
      System.out.println(m.getUser_password());
      
      int result = mService.count_pass_cnt(m);
      
      
      return result;
   }
      
   @RequestMapping(value="find_user_password.me", method=RequestMethod.GET)
   public String find_user_passwordPage(HttpServletRequest reques) {
      
      System.out.println("비밀번호 찾기 페이지로 이동");
      
      
      return "findUserPassword/findUserPassword";
   }   
   
   
   // pass_cnt 초기화 
   @RequestMapping(value ="reset_pass_cnt.me", method = RequestMethod.GET)
   public void reset_pass_cnt(@RequestParam("user_id")String user_id) {
      logger.info("reset_pass_cnt 컨트롤러 진입!!!!!!!!!!");
      mService.reset_pass_cnt(user_id);
   }
   
   // 승재 mypage 내정보수정 페이지이동
    @RequestMapping(value="edit_my_inform.me", method=RequestMethod.GET)
    public String move_edit_my_inform(HttpServletRequest request) {

        return "myPage/Edit_Information";
    }
    
  //승재 Edit_my_inform 컨트롤러
    @RequestMapping(value = "Edit_MyInform.me", method = RequestMethod.POST)
    public String Edit_MyInform(@RequestParam("yy")String age,@RequestParam("user_name")String user_name, @RequestParam("nickname")String nickname, Model model,
    		HttpServletRequest request) {
        logger.info("내정보 수정 컨트롤러 진입");
      
      HttpSession session = request.getSession();
      MemberVO m = (MemberVO)session.getAttribute("loginUser");
  	  int year = Calendar.getInstance().get(Calendar.YEAR);
  	  m.setUser_id(m.getUser_id());
  	  m.setAge(Integer.toString(year - Integer.parseInt(age) + 1));
  	  m.setUser_name(user_name);
  	  m.setNickname(nickname);
  	  
  	  
  	  System.out.println(m);
  	  
        mService.Edit_MyInform(m);  
        return "redirect:myPage.me";
        
    }
    
    
    //프로필 변경 메서드 
    @RequestMapping(value = "user_profile_change.me", method = RequestMethod.POST)
    @ResponseBody
    public String user_profile_change(@RequestParam("editImg") MultipartFile editImg, MultipartHttpServletRequest request,@ModelAttribute Files files) {
  
    	logger.info("유저 프로필 수정 컨트롤러 진입 ");
 
		  HttpSession session = request.getSession(); 
		  MemberVO m = (MemberVO)session.getAttribute("loginUser");
		  System.out.println(m);
		  System.out.println(m.getUser_id());
		  System.out.println(m.getUser_no());
		  
			 
		  int user_no = m.getUser_no();

        	
           // 이미지 저장할 경로 지정
           String root = request.getSession().getServletContext().getRealPath("resources");
           String savePath = root + "/userProfile_uploadFile";
           
           //디렉토리가 없다면 디렉토리 생성
           File folder = new File(savePath);
           if(!folder.exists()) {
              folder.mkdirs();
           }
                                                     
           //날짜를 원하는 형태로 출력 
           SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
           Date today = new Date();
           
           String originFileName = editImg.getOriginalFilename();           
           String renameFileName = sdf.format(today) + originFileName.substring(originFileName.lastIndexOf(".")+1);
           String renamePath = folder + "/" + renameFileName;
           
           
           
           
           files.setRefNo(user_no);
           files.setFileName(originFileName);
           files.setChangeName(renameFileName);
           files.setFilePath(renamePath);
           files.setFileYn("N");
           files.setRefFlag(3);
           
           
             
             try {
                // MultipartFile로 받은 파일을 transferTo( ) 함수를 통해 renamePath()경로에  저장
               editImg.transferTo(new File(renamePath));
            } catch (Exception e) {
               e.printStackTrace();
            }
         
       
          logger.debug("------------- file start -------------"); 
          logger.debug("originalFileName : " + originFileName); 
          logger.debug("renameFileName : " + renameFileName);
          logger.debug("renamePath : " + renamePath); 
          logger.debug("-------------- file end --------------\n");
          
  
         
          mService.delete_user_profile(user_no);
          
         int result = mService.user_profile_change(files);
         

         if(result == 1) {
        	 
        	String user_profile_changeName= mService.select_user_profile_changeName(files);
        	
        	//그럼이제 리턴값이 db에서 잘 가져왓는지 확인해야겟죠?
        	System.out.println(user_profile_changeName);
        	
        	return user_profile_changeName;
        	 
        	
         }else {
        	 
        	 String errorMsg = "db에 값이 잘 저장되지 못했습니다";
        	 return errorMsg;
         }
		
         
        
         
          
    }
    
    
    
    
    
    
    
    
    
    
    // 종훈 아이디 찾기 페이지 이동 컨트롤러
    @RequestMapping("find_id_view.me")
   public String findIdview() {
      return "findMember/findId";
   }
    
    // 종훈 아이디 찾기 결과 컨트롤러
    @RequestMapping(value = "find_id_result.me", method = RequestMethod.POST)
    public String findIdresult(@RequestParam("email") String email, Model m) {
      
       MemberVO membervo = mService.findIdresult(email);
       System.out.println("결과는~~~" + membervo);
       if(membervo != null) {
          m.addAttribute("membervo", membervo);
         return "findMember/findIdResult";
      } else {
         System.out.println("안됨");
         return null;
      }
   }
    
    
    
    @RequestMapping("getprofile.me")
    @ResponseBody
    public String getprofile(HttpSession session) {

        int user_no = ((MemberVO)session.getAttribute("loginUser")).getUser_no();

        String changeName = mService.selectChangeName(user_no);

        System.out.println("이름 : "+changeName);

        return changeName;
    }
    
    
    
    //승재씨 코드 
 // id, email 일치확인 컨트롤러(비밀번호찾기)
    @RequestMapping(value = "idEmailCheck.me", method = RequestMethod.GET)
    @ResponseBody
    public int idEmailCheck(MemberVO m, @RequestParam("user_id") String user_id, @RequestParam("email") String email) {
       m.setUser_id(user_id);
       m.setEmail(email);
       logger.info("비밀번호 찾기 페이지 이메일 아이디 일치여부 controller 진입");
       System.out.println("m의 값 :" + m);
       int result = mService.userIdemailCheck(m);
       
       System.out.println("result 값 : " + result);
       
       if(result > 0) {
          return result;
       }else {
          return 0;
       }
    }
    
    
     // 승재 비밀번호 찾기 > 변경으로 이동 컨트롤러
     @RequestMapping(value = "PwdupdatePage.me", method = RequestMethod.POST)
     public String updatepwdpage(@RequestParam("user_id") String user_id, Model m) {
       
        MemberVO membervo = mService.findPwdresult(user_id);

        if(membervo != null) {
           m.addAttribute("membervo", membervo);
          return "findUserPassword/findUserPwdResult";
       } else {
          return null;
       }
    }
     
     // 승재 비밀번호 재설정 기능
    @RequestMapping(value = "updatepwdwwww.me", method = RequestMethod.POST)
    public String updatePwd(MemberVO m,@RequestParam("user_id") String user_id, @RequestParam("updatepass2") String user_pwd) {
        
        
       logger.info("비밀번호 재설정 controller 진입");
       m.setUser_id(user_id);
      
      
       String encPassword = passwordEncoder.encode(user_pwd);
       m.setUser_password(encPassword);
       
   	   int result = mService.updatePwd(m);
   	   
   	   if(result == 1) {
    	   return "login/login";
   	   }
   	   else {
   		   System.out.println("비밀번호 변경 실패");
   		   return null;
   	   }
       
       
      
       
      
       
    }
     
    
    
    
    
    
    
}