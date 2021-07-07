package com.kh.Final_cccc.material.model.service;

import java.util.ArrayList;

import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.material.model.vo.Material;

public interface MaterialService {

	int insertMate(Material material);

	int getdeleteMateStatus(Material material);

	Material getMaterialDetail(int matrialNo);

	int searchMateListCount(String value);

	ArrayList<Material> searchMateList(String value, PageInfo pi);

}
