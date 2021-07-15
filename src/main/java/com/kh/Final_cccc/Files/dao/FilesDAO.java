package com.kh.Final_cccc.Files.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.Event.model.vo.PageInfo;
import com.kh.Final_cccc.Files.vo.Files;

@Repository("fdao")
public class FilesDAO {

	public int insertFiles(SqlSessionTemplate sqlSession, Files fileList) {
		return sqlSession.insert("filesMapper.insertFiles" , fileList);
	}

	public ArrayList<Files> selectFiles(SqlSessionTemplate sqlSession, int eventNo) {
		return (ArrayList)sqlSession.selectList("filesMapper.selectFiles", eventNo);
	}

	public ArrayList<Files> selectFileList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("filesMapper.selectFilesList", pi);
	}

	public ArrayList<Files> selectAdminFileList(SqlSessionTemplate sqlSession,
			com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		return (ArrayList)sqlSession.selectList("filesMapper.selectAdminFilesList", pi);
	}

	public int updateFiles(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.update("filesMapper.updateFiles", f);
	}

	public int insertRFiles(SqlSessionTemplate sqlSession, Files f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("filesMapper.insertRFiles" , f);
	}

}
