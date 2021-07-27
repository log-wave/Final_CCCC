package com.kh.Final_cccc.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.member.service.MemberService;



/*
    @SessionAttributes 의 특징 
    
    -수정 작업을 처리할떄 유용하게 사용할 수 있다. 특히 데이터의 null 관리에 효율적이다. 만약 사용자가 회원 정보를 수정할 때  비밀번호만 변경할 시  나머지 수정할 수 있는 부분(닉네임 , 메일주소etc)
    등은 null값으로 db에 저장이 된다. 이 때 sessionAttribute를 사용하게 되면 다음과 같은 효과가 있다. 
    
    먼저 사용자가 회원정보 수정 화면을 요청하면 해당 메서드는 검색 결과인 MemberVO를 loginUser라는 이름으로 Model에 저장하게 된다. Model 에 loginUser라는 이름으로 저장되는 데이터가 있다면 
    그 데이터를 세션에도 자동으로 저장하라는 설정이다. 
    
    즉 일차적으로 회원정보 수정 메서드가 실행되어 해당 화면이 출력되면 일차적으로 Model에 loginUser라는 이름으로 MmeberVO 객체가 저장되고 , 세션에도  loginUser라는 MemberVO객체가 저장된다. 
    
    이 후 사용자가 회원정보 수정 버튼을 클릭하면 매개변수로 선언된 MemberVO 앞에 @ModelAttribute 가 추가된다. 스프링 컨테이너는 우선 @ModelAttribute("loginUser") 설정을 해석하여 세션에 
    
    loginUser라는 이름으로 저장된 데이터가 있는지 확인한다. 그리고 그 값이 있다면 해당 객체를 세션에서 꺼내서 매개변수로 선언된 vo변수에 할당한다. 그리고 사용자가 입력한 파라미터 값을 vo객체에 할당한다. 이때 사용자가 
    입력한 수 정정보 값만 새롭게 할당되고 , 나머지는 상세 보기를 했을때 세션에 저장된 데이터가 유지된다. 
    
    
 */
   

/* 
   
   @ModelAttribute 
   
   1 . 커멘드 객체의 이름을 변경 할 때 사용 
   2. view(jsp)에서 사용 할 데이터를 설정하는 용도로도 사용 -> ModelAttribute 메서드 실행 결과로 리턴된 객체는 자동으로 Model에 저장된다. 따라서 @ModelAttribute 메서드의 실행 결과로 리턴된 
   객체를를 view페이지에서 사용할 수 있다. 
   
   
 */


@SessionAttributes("loginUser")

@Controller // MemberController를 Controller의 성질을 갖는 객체로 등록하겠다.
public class MemberController {
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   private MemberService mService;
   
   
   @RequestMapping(value="loginPage.me", method=RequestMethod.GET)
   public String login(HttpServletRequest request) {
      
      return "login/login";
   }
   
   
   @RequestMapping(value="myPage.me", method=RequestMethod.GET)
   public String moveMyPage(HttpServletRequest request) {
      System.out.println("헤더에서 마이페이지 요청 넘어옴 ");
      return "myPage/MyPage";
   }
   
   @RequestMapping(value="withdrawalGuide.me", method=RequestMethod.GET)
   public String moveWithdrawalGuide(HttpServletRequest request) {

      return "myPage/withdrawalGuide";
   }   
   
   
   @RequestMapping(value="deleteMemberPage.me", method=RequestMethod.GET)
   public String movDeleteMemberPage(HttpServletRequest request) {

      return "deleteMember/deleteMember";
   }
   
   
   
   
   @RequestMapping(value="backIndex.do", method=RequestMethod.GET)
   public String backIndex(HttpServletRequest reques) {
      
      System.out.println("인덱스 페이지로 이동");
      
      
      return "index";
   }
   
   @RequestMapping(value="adminPage.me", method=RequestMethod.GET)
   public String adminPage(HttpServletRequest reques) {
      
      System.out.println("관리자 페이지로 이동");
      
      
      return "redirect:adminMember.ad";    
   }
   
   
   @RequestMapping(value="logoutPage.me")
   public String logoutPage(HttpSession session,SessionStatus status) {
      
   
      session.invalidate();
      status.setComplete();
      
      System.out.println("setComplete가 실행된 후의 세션값 유무 확인");
      
      
      return "redirect:backIndex.do"; 
   }
   
   
   
   @RequestMapping(value="loginCheck.me", method=RequestMethod.POST)
   @ResponseBody
   public int loginCheck(MemberVO m, Model model) {
      
      System.out.println(m);
      
      MemberVO loginUser = mService.loginCheck(m);
      
      
      if(loginUser != null) {
         
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
   
   

   
   @RequestMapping(value="insertMemberTerms.me", method=RequestMethod.GET)
   public String insertMemberTermsPage(HttpServletRequest request) {
      
      return "insertMember/insertMemberTerms";
   }
   
   @RequestMapping(value="insertMemberForm.me", method=RequestMethod.GET)
   public String insertMemberForm(HttpServletRequest request) {
      
      return "insertMember/InsertMember";
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
    public String insertMember(@ModelAttribute MemberVO m ,@RequestParam("yy")String age  ) {

        logger.info("회원가입 컨트롤러 진입");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        m.setAge(Integer.toString(year - Integer.parseInt(age) + 1));

        System.out.println(m);

        mService.insertMember(m);


        return "redirect:backIndex.do";


    }
   
   //회원탈퇴 체크 컨트롤러 
   
   @RequestMapping(value="deleteMemberCheck.me", method=RequestMethod.POST)
   @ResponseBody
   public int deleteMemberCheck(MemberVO m, Model model,SessionStatus status ){
      
      logger.info("회원 탈퇴 체크 컨트롤러 진입");
      
      System.out.println(m.getUser_id());
      System.out.println(m.getUser_password());
      status.setComplete();
      int result = mService.deleteMemberCheck(m);
      
      return result;
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
    public String Edit_MyInform(@ModelAttribute MemberVO m ,@RequestParam("yy")String age, @RequestParam("editImg") MultipartFile editImg,
         MultipartHttpServletRequest request, Model model) {
        logger.info("내정보 수정 컨트롤러 진입");
        
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
           
           
          
             
             try {
                // MultipartFile로 받은 파일을 transferTo( ) 함수를 통해 renamePath()경로에  저장
               editImg.transferTo(new File(renamePath));
            } catch (Exception e) {
               e.printStackTrace();
            }
         
       
          logger.debug("------------- file start -------------"); 
          logger.debug("originalFileName : " + originFileName); 
          logger.debug("renameFileName : " + renameFileName); 
          logger.debug("-------------- file end --------------\n");

         
          
        /*--------------------------------------------------------------------------------------------------------------------------------*/
        int year = Calendar.getInstance().get(Calendar.YEAR);
        m.setAge(Integer.toString(year - Integer.parseInt(age) + 1));
        System.out.println(m);

        mService.Edit_MyInform(m);  
        return "myPage/MyPage";
    }
    
    

    @RequestMapping(value = "user_profile_change.me", method = RequestMethod.POST)
    @ResponseBody
    public String user_profile_change(@RequestParam("editImg") MultipartFile editImg, MultipartHttpServletRequest request,@ModelAttribute Files files) {
        	logger.info("유저 프로필 수정 컨트롤러 진입 ");
        	
        	
        	//세션에 저장되어 있는 값 확인
			
			/*
			 * Enumeration se = session.getAttributeNames(); while (se.hasMoreElements()) {
			 * 
			 * String getse = se.nextElement() + "";
			 * 
			 * System.err.println("@@@@@@@ session : " + getse + " : " +
			 * session.getAttribute(getse));
			 * 
			 * }
			 */
        	
        	
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
       m.setUser_password(user_pwd);
       System.out.println("m의 값 :" + m);
       int result = mService.updatePwd(m);
       
       if(result > 0) {
          return "login/login";
       }else {
          return null;
       }
       
    }
     
    
    
    
    
    
    
}