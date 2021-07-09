package com.kh.Final_cccc.Files.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.Event.model.vo.PageInfo;
import com.kh.Final_cccc.Files.dao.FilesDAO;
import com.kh.Final_cccc.Files.vo.Files;

@Service("fService")
public class FilesServiceimp implements FilesService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FilesDAO fdao;

	@Override
	public int insertFiles(Files fileList) {
		return fdao.insertFiles(sqlSession, fileList);
	}

	@Override
	public ArrayList<Files> selectFiles(int eventNo) {
		return fdao.selectFiles(sqlSession, eventNo);
	}

	@Override
	public ArrayList<Files> selectFileList(PageInfo pi) {
		return fdao.selectFileList(sqlSession, pi);
	}

	@Override
	public ArrayList<Files> selectAdminFileList(com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		return fdao.selectAdminFileList(sqlSession, pi);
	}
}
