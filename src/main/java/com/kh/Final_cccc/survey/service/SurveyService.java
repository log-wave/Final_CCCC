package com.kh.Final_cccc.survey.service;

import com.kh.Final_cccc.survey.model.vo.Survey;

public interface SurveyService {

	int insertSurvey(Survey sv);

	int member_yn_chk(int user_no);

}
