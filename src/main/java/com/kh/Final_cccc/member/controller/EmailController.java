package com.kh.Final_cccc.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.kh.Final_cccc.member.service.MemberService;


@Controller
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	static String emailToRecipient, emailSubject, emailMessage,userName;
	static final String emailFromRecipient = "zerad1763@gmail.com";

	static ModelAndView modelViewObj = new ModelAndView("jsonView");
	
	@Autowired
	private MemberService mService;
	
	@Autowired
    private JavaMailSender mailSenderObj;
	
	final CommonsMultipartFile attachFileObj = null;
	
	//이메일 템플릿 엔진 이용
	@Autowired
	private TemplateEngine emailTemplateEngine;
	
	//인증번호 난수 생성 
	Random random = new Random();
	String checkNum = Integer.toString(random.nextInt(888888) + 111111);
	
	
	
	private String setContext(String userName,String checkNum) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("userName", userName); // Template에 전달할 데이터 설정
        context.setVariable("checkNum", checkNum);
        return emailTemplateEngine.process("signUpEmailAuthentication", context); // mail.html 
    }
	
	
	
	  // This Method Is Used To Prepare The Email Message And Send It To The Client
    @RequestMapping(value = "emailSend.me", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView sendEmailToClient(HttpServletRequest request,@RequestParam Map<String,Object>param) {
    	
    	
    	System.out.println("이메일 컨트롤러 구동 시작!!!!!!");
    	
    	// Reading Email Form Input Parameters      
    	emailToRecipient = (String)param.get("email");
    	emailSubject = (String)param.get("subject");
    	userName = (String)param.get("userName");
    	
    	System.out.println(userName);
    	System.out.println(emailToRecipient);
    	System.out.println(checkNum);
    	emailMessage = setContext(userName,checkNum);
    	
    	
        
 
        // Logging The Email Form Parameters For Debugging Purpose
        System.out.println("\nReceipient?= " + emailToRecipient + ", Subject?= " + emailSubject + ", Message?= " + emailMessage + "\n");
        
        mailSenderObj.send(new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
            	
                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");             
                mimeMsgHelperObj.setTo(emailToRecipient);
                mimeMsgHelperObj.setFrom(emailFromRecipient);               
                mimeMsgHelperObj.setText(emailMessage,true);
                mimeMsgHelperObj.setSubject(emailSubject);
 
                // Determine If There Is An File Upload. If Yes, Attach It To The Client Email              
                if ((attachFileObj != null) && (attachFileObj.getSize() > 0) && (!attachFileObj.equals(""))) {
                    System.out.println("\nAttachment Name?= " + attachFileObj.getOriginalFilename() + "\n");
                    mimeMsgHelperObj.addAttachment(attachFileObj.getOriginalFilename(), new InputStreamSource() {                   
                        public InputStream getInputStream() throws IOException {
                            return attachFileObj.getInputStream();
                        }
                    });
                } else {
                    System.out.println("\nNo Attachment Is Selected By The User. Sending Text Email!\n");
                }
            }
        });
        System.out.println("\nMessage Send Successfully.... Hurrey!\n");
        
		/*
		 * modelViewObj = new
		 * ModelAndView("success.","messageObj","Thank You! Your Email Has Been Sent!");
		 */
         modelViewObj.addObject("emailSubject",emailSubject);
         modelViewObj.addObject("emailToRecipient",emailToRecipient);
         modelViewObj.addObject("checkNum",checkNum);
         
       
         return modelViewObj; 
         
    }
    
 // 이메일 중복 체크 컨트롤러
 	@RequestMapping(value = "emailCheck.me", method = RequestMethod.GET)
 	@ResponseBody
 	public int emailCheck(@RequestParam("email") String email) {
 		
 		
 		
 		System.out.println(email);
 		logger.info("이메일 중복검사 컨트롤러 진입");
 		
 		
 		return  mService.emailCheck(email);
		/*
		 * if(result >0) { System.out.println("정상으로 받아오네"); return "정상으로 받아옴";
		 * 
		 * }else { System.out.println("못받아오네........ajax쪽에 문제가 있는듯"); return "받아오지 못하네";
		 * }
		 */
 		
 	
 		
 		
 		
 	}
    
    
    
    
    
    
    
    
    
}