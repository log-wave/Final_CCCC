package com.kh.Final_cccc.survey.controller;

// 다시
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.Final_cccc.member.controller.MemberController;
import com.kh.Final_cccc.survey.exception.SurveyException;
import com.kh.Final_cccc.survey.model.vo.Survey;
import com.kh.Final_cccc.survey.service.SurveyService;

@Controller
public class SurveyController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private SurveyService sService;
	
	@RequestMapping("svinsertView.sv")
	public String SurveyForm() {
		return "/Surveyform";
	}
	
	@RequestMapping(value="svSubmit.sv", method=RequestMethod.GET)
	@ResponseBody
	public int insertSurvey(@ModelAttribute Survey sv, HttpServletRequest request, @RequestParam("user_no") int user_no,
							   @RequestParam("chk_info1") String chk_info1, @RequestParam("chk_info2") String chk_info2,
							   @RequestParam("chk_info3") String chk_info3, @RequestParam("chk_info4") String chk_info4,
							   @RequestParam("chk_info5") String chk_info5) {
		
		sv.setUser_no(user_no);
		sv.setSurvey_one(chk_info1);
		sv.setSurvey_two(chk_info2);
		sv.setSurvey_three(chk_info3);
		sv.setSurvey_four(chk_info4);
		sv.setSurvey_five(chk_info5);
		System.out.println("나와라~~~~~~" + sv);
		int result = sService.insertSurvey(sv);
		System.out.println("값이 잘 나옴? : " + result);
			return result;
		}
	
	
	// member_yn 체크
		@RequestMapping(value ="member_survey_yn_change.sv", method = RequestMethod.GET)
		public String member_yn_chk(@RequestParam("user_no")int user_no) {
			System.out.println("유저가 들어왔나 : " + user_no);
			logger.info("member_yn_chk 컨트롤러 진입했음.");
			sService.member_yn_chk(user_no);
			return "redirect: eventList.ev";
		}	
		
		//설문조사 상세 페이지 이동
		@RequestMapping("surveydetail.sv")
		public String surveydetailForm () {
			return "Surveydetailform";
		}
}

