package com.kh.Final_cccc.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.admin.model.dao.AdminDAO;

@Service("adService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adDAO;
}
