package com.kh.Final_cccc.material.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.material.model.dao.MaterialDAO;
import com.kh.Final_cccc.material.model.vo.Material;

@Service("maService")
public class MaterialServiceimp implements MaterialService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MaterialDAO maDAO;

	@Override
	public int insertMate(Material material) {
		return maDAO.insertMate(sqlSession, material);
	}

	@Override
	public int getdeleteMateStatus(Material material) {
		return maDAO.getdeleteMateStatus(sqlSession, material);
	}

	@Override
	public Material getMaterialDetail(int matrialNo) {
		return maDAO.MaterialDetail(sqlSession, matrialNo);
	}

	@Override
	public int searchMateListCount(String value) {
		return maDAO.searchMateListCount(sqlSession, value);
	}

	@Override
	public ArrayList<Material> searchMateList(String value, PageInfo pi) {
		return maDAO.searchMateList(sqlSession, value, pi);
	}

	@Override
	public int checkMateName(String materialName) {
		return maDAO.checkMateName(sqlSession, materialName);
	}
}
