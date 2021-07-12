package com.kh.Final_cccc.material.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.admin.model.service.AdminService;
import com.kh.Final_cccc.board.exception.BoardException;
import com.kh.Final_cccc.common.PagenationAdmin;
import com.kh.Final_cccc.material.exception.MaterialException;
import com.kh.Final_cccc.material.model.service.MaterialService;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;

@Controller
public class MaterialController {

	@Autowired
		private MaterialService maService;
	
	@Autowired
		private AdminService adService;
	
	
	@RequestMapping(value="insertMate.ad") 
	public void insertMate(@ModelAttribute Material material,  HttpServletResponse response ) {
		System.out.println("material : " + material);
		
		int result = maService.insertMate(material);
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
	
	@RequestMapping(value="deleteMateStatus.ad")
	public String getdeleteMateStatus(@RequestParam(value="check[]", required=false) int [] check, @ModelAttribute Material material) {
		
		int result = 0;
		for(int i = 0; i <= check.length - 1; i++ ) {
			material.setMaterialNo(check[i]);
			result = maService.getdeleteMateStatus(material);
		}
		
		if(result > 0) {
			return "redirect:adminMaterial.ad";
		} else {
			System.out.println("재료 삭제 안됨");
			return null;
		}
	}
	
	@RequestMapping(value="searchMate.ad")
	public ModelAndView materialSearch(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String value , ModelAndView mv) {
		System.out.println(value);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(!value.isEmpty()) {
			
			int listCount = maService.searchMateListCount(value);
			System.out.println(listCount);
			com.kh.Final_cccc.admin.model.vo.PageInfo pi = PagenationAdmin.getPageInfo(currentPage, listCount);
			
			ArrayList<Material> list = maService.searchMateList(value , pi);
			
			mv.addObject("list", list).addObject("pi", pi).addObject("value" , value).setViewName("admin_material/admin_Material");
		}
			
		return mv;
	}
	
	@RequestMapping(value="checkMateName.ad") 
	public void checkMateName(@RequestParam (value= "materialName", required=false) String materialName , HttpServletResponse response) {
		System.out.println("materialName : " + materialName);
		int result = maService.checkMateName(materialName); 
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.print("no");
			}else {
				out.print("yes");
			}
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	
	
}
