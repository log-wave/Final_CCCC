package com.kh.Final_cccc.survey.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.board.model.dao.BoardDAO;
import com.kh.Final_cccc.survey.model.dao.SurveyDAO;
import com.kh.Final_cccc.survey.model.vo.Survey;

@Service("sService")
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SurveyDAO sDAO;

	@Override
	public int insertSurvey(Survey sv) {
		return sDAO.insertSurvey(sqlSession, sv);
	}

	@Override
	public int member_yn_chk(int user_no) {
		return sDAO.member_yn_chk(sqlSession, user_no);
	}

	@Override
	public String selectYn(int user) {
		return sDAO.selectYn(sqlSession, user);
	}


}
