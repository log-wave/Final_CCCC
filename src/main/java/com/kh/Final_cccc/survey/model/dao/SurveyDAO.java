package com.kh.Final_cccc.survey.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.survey.model.vo.Survey;

@Repository("sDAO")
public class SurveyDAO {

	public int insertSurvey(SqlSessionTemplate sqlSession, Survey sv) {
		return sqlSession.insert("surveyMapper.insertSurvey", sv);
	}
}
