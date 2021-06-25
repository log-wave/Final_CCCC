package com.kh.Final_cccc.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	@Autowired
	private MemberService mService;
	
	
	
	@RequestMapping(value="loginPage.me", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		System.out.println("헤더에서 로그인 요청 넘어옴 ");
		return "login/login";
	}
	

	@RequestMapping("backIndexPage.me")
	public String backIndexPage() {
		
		return "/index";
	}
	
	
	
	
	
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(MemberVO m, Model model) {

		System.out.println("로그인 아이디 :" + m.getUser_id());
		MemberVO loginUser = mService.memberLogin(m);
	
		if(loginUser != null) {
		model.addAttribute("loginUser", loginUser);
		return ""; 		
		} else {
		
			System.out.println(loginUser.getUser_id());
			return "/WEB-INF/views/error/error";
			}
	}
	
}
