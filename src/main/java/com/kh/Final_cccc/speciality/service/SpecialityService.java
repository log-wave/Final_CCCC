package com.kh.Final_cccc.speciality.service;

import java.util.ArrayList;

import com.kh.Final_cccc.admin.model.vo.PageInfo;
import com.kh.Final_cccc.speciality.model.vo.Speciality;

public interface SpecialityService {

	int getSpeListCount();

	ArrayList<Speciality> selectSpeList(PageInfo pi);

	Speciality specialityDetail(int specialityNo);

}
