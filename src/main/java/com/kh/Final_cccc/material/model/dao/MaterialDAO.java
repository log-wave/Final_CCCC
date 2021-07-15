package com.kh.Final_cccc.material.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.admin.model.vo.PageInfo;
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

	public int searchMateListCount(SqlSessionTemplate sqlSession, String value) {
		return sqlSession.selectOne("materialMapper.searchMateListCount", value);
	}

	public ArrayList<Material> searchMateList(SqlSessionTemplate sqlSession, String value , PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("materialMapper.searchMateList" , value, rowBounds);
	}

	public int checkMateName(SqlSessionTemplate sqlSession, String materialName) {
		return sqlSession.selectOne("materialMapper.checkMateName" , materialName);
	}

}
