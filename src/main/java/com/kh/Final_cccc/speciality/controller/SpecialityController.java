package com.kh.Final_cccc.speciality.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.common.PagenationAdmin;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.speciality.model.vo.Speciality;
import com.kh.Final_cccc.speciality.service.SpecialityService;

@Controller
public class SpecialityController {

	@Autowired
	private SpecialityService speService;
	
	
	@RequestMapping("specialityDetailForm.ad")
	public String specialityDetail(@RequestParam(value="no") int specialityNo, Model model ) {
		
		Speciality speciality = speService.specialityDetail(specialityNo);
		
		if(speciality != null) {
			model.addAttribute("spe" , speciality);
			return "admin_speciality/admin_SpecialityDetail";
		} else { 
			System.out.println("특산물 상세보기 실패");
			return null;
		}
	}
	
	@RequestMapping("insertSpeForm.ad")
	public String specialityinsert() {
		return "admin_speciality/insertSpeForm/insertSpeForm";
	}
	
	
}
