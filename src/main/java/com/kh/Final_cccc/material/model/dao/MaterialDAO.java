package com.kh.Final_cccc.material.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.material.model.vo.Material;

@Repository("maDAO")
public class MaterialDAO {

	public int insertMate(SqlSessionTemplate sqlSession, Material material) {
		return sqlSession.insert("materialMapper.insertMate", material);
	}

	public int getdeleteMateStatus(SqlSessionTemplate sqlSession, Material material) {
		return sqlSession.update("materialMapper.deleteMateStatus", material);
	}

	public Material MaterialDetail(SqlSessionTemplate sqlSession, int matrialNo) {
		return sqlSession.selectOne("materialMapper.detailMate", matrialNo);
	}

}
