package com.kh.Final_cccc.speciality.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.speciality.model.dao.SpecialityDAO;
import com.kh.Final_cccc.speciality.model.vo.Speciality;

@Service("speService")
public class SpecialityServiceImpl implements SpecialityService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SpecialityDAO speDAO;

	@Override
	public int getSpeListCount() {
		return speDAO.getSpeListCount(sqlSession);
	}

	@Override
	public ArrayList<Speciality> selectSpeList(PageInfo pi) {
		return speDAO.selectSpeList(sqlSession, pi);
	}

	@Override
	public Speciality specialityDetail(int specialityNo) {
		return speDAO.selectSpeDetail(sqlSession ,specialityNo);
	}
}
