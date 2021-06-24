package com.kh.Final_cccc.memer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@RequestMapping(value="loginPage.me", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		System.out.println("로그인 메서드 들어옴!");
		return "login/login";
	}
	
	@RequestMapping(value="insert.me", method=RequestMethod.POST)
	public String insert(HttpServletRequest request) {
		System.out.println("insert 메서드 들어옴!");
		return "insert";
	}
	
}
