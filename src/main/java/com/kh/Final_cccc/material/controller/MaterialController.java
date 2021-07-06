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
	
	
	
	
	
	
	
	
	
}
