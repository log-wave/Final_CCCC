package com.kh.Final_cccc.sns.naver;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverController {

	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private MemberService mService;
	
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverLogin.sns", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public HashMap<String, String> login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		
		System.out.println("네이버:" + naverAuthUrl);

	

		HashMap<String, String> naverUrl = new HashMap<String, String>();
		naverUrl.put("url", naverAuthUrl);

		return naverUrl;
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverCallback.sns", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String 형식의 json 데이터 
		
		
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		//response의 nickname값 파싱
		
		String user_id = (String)response_obj.get("id");
		String user_password = "naver_password";
		String user_name = (String)response_obj.get("name");
		String email = (String)response_obj.get("email");
		String nickname = (String) response_obj.get("nickname");
		String gender = (String) response_obj.get("gender");
		String age = (String) response_obj.get("birthyear"); 
		
		System.out.println(user_id);
		System.out.println(user_name);
		System.out.println(email);
		System.out.println(nickname);
		System.out.println(gender);
		System.out.println(age);
		
		MemberVO m = new MemberVO();
		int year = Calendar.getInstance().get(Calendar.YEAR);
	    
		m.setUser_id(user_id);
		m.setUser_password(user_password);
		m.setUser_name(user_name);
		m.setEmail(email);
		m.setNickname(nickname);
		m.setGender(gender);
		m.setAge(Integer.toString(year - Integer.parseInt(age) + 1));
		
		MemberVO naverMember = mService.loginCheck(m);
		
		//네이버 로그인 데이터가 저장되어 있는 경우 
		if(naverMember != null) {
			
			//4.파싱 닉네임 세션으로 저장
			System.out.println(naverMember);
			session.setAttribute("naverMember", naverMember); // 세션 생성
			
			model.addAttribute("naver_login_result", apiResult);
			return "redirect:backIndex.do";
			
		}else {
		
			//네이버 데이터가 없는 경우 
			int result = mService.insertMember(m);
			System.out.println(result);
			if(result == 1) {
				
				MemberVO new_naverMember = mService.loginCheck(m);
				
				System.out.println(new_naverMember);
				
				session.setAttribute("naverMember", new_naverMember); // 세션 생성
				model.addAttribute("naver_login_result", apiResult);
				return "redirect:backIndex.do";
				
			}
			return null;
			
		}
	
			
			
	}
	/*
	 * //로그아웃
	 * 
	 * @RequestMapping(value = "/naverLogout.sns", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String logout(HttpSession session) throws
	 * IOException { System.out.println("여기는 logout"); session.invalidate(); return
	 * "redirect:backIndex.do"; }
	 */
}
