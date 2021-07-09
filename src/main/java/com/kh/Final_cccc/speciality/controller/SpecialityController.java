package com.kh.Final_cccc.speciality.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.common.PagenationAdmin;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.speciality.model.vo.Speciality;
import com.kh.Final_cccc.speciality.service.SpecialityService;

@Controller
public class SpecialityController {

	@Autowired
	private SpecialityService speService;
	
	@Autowired
	private AdminService adService;
	
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
	
	@RequestMapping("mList.ad") 
	public void MateList(@RequestParam("mNo") int mNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Material> mList = speService.selectmaterialList(mNo);
		
		System.out.println(mList);
		
		new GsonBuilder().create().toJson(mList, response.getWriter());
	}
	
	@RequestMapping("insertSpe.ad")
	public void insertSpeciality(@ModelAttribute Speciality speciality, HttpServletResponse response) {
		System.out.println("speciality" + speciality);
		
		int result = speService.insertSpeciality(speciality);
		
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.print("ok");
			}else {
				out.print("fail");
			}
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("searchSpeciality.ad") 
	public ModelAndView searchSpeciality(@RequestParam(value="page", required = false) Integer page, @RequestParam("searchValue") String value, 
			@RequestParam("searchCondition") String condition, Speciality spe, ModelAndView mv) {
		
		System.out.println(condition);
		System.out.println(value);
		
		if(condition.equals("region")) {
			spe.setSpecialityRegion(value);
		} else if(condition.equals("speName")) {
			spe.setSpecialityName(value);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(!value.isEmpty()) {
			int listCount = speService.searchSpeListCount(spe);
			
			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
			
			ArrayList<Speciality> list = speService.searchSpeResultList(spe, pi);
			System.out.println("list" + list);
			
			mv.addObject("list", list).addObject("pi", pi).addObject("searchValue" , value).addObject("searchCondition", condition).setViewName("admin_speciality/admin_Speciality");
		}
		
		return mv;
	}
	
	@RequestMapping("deleteSpeStatus.ad")
	public String deleteSpeStatus(@RequestParam(value="check[]", required=false) int [] check, @ModelAttribute Speciality spe) {
		
		System.out.println(check);
		int result = 0;
		for(int i = 0; i <= check.length - 1; i++ ) {
			spe.setSpecialityNo(check[i]);
			result = speService.getdeleteSpeStatus(spe);
		}
		
		if(result > 0) {
			return "redirect:adminSpeciality.ad";
		} else {
			System.out.println("재료 삭제 안됨");
			return null;
		}
		
	}
}
