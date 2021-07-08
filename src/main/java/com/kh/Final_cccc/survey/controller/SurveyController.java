package com.kh.Final_cccc.survey.controller;

// 다시
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.Final_cccc.survey.exception.SurveyException;
import com.kh.Final_cccc.survey.model.vo.Survey;
import com.kh.Final_cccc.survey.service.SurveyService;

@Controller
public class SurveyController {
	@Autowired
	private SurveyService sService;
	
	@RequestMapping("svinsertView.sv")
	public String SurveyForm() {
		return "/Surveyform";
	}
	
	@RequestMapping("svSubmit.sv")
	public String insertSurvey(@ModelAttribute Survey sv, HttpServletRequest request, @RequestParam("user_no") int user_no,
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
		
		if(result > 0) {
			return "redirect:eventList.ev";
		} else {
			throw new SurveyException("설문 등록에 실패하였습니다.");
		}
	}
}
