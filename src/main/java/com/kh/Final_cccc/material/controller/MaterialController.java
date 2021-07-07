package com.kh.Final_cccc.material.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.Final_cccc.board.exception.BoardException;
import com.kh.Final_cccc.material.exception.MaterialException;
import com.kh.Final_cccc.material.model.service.MaterialService;
import com.kh.Final_cccc.material.model.vo.Material;
import com.kh.Final_cccc.member.model.vo.MemberVO;

@Controller
public class MaterialController {

	@Autowired
		private MaterialService maService;
	
	
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
	
	
	
	
	
	
	
	
	
	
}
