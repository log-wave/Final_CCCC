package com.kh.Final_cccc.Event.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.Event.exception.EventException;
import com.kh.Final_cccc.Event.model.service.EventService;
import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.Event.model.vo.PageInfo;
import com.kh.Final_cccc.common.Files;
import com.kh.Final_cccc.common.PagenationEvent;

import oracle.net.aso.b;

@Controller
public class EventController {
	
	@Autowired
		private EventService eService;
	
	@RequestMapping(value="eventList.ev" , method=RequestMethod.GET)
	public ModelAndView EventList(@RequestParam(value="page" , required= false)Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = eService.getListCount();

		PageInfo pi = PagenationEvent.getPageInfo(currentPage, listCount);
		
		ArrayList<Event> elist = eService.selectEventList(pi);
		
		if(elist != null) {
			mv.addObject("elist", elist).addObject("pi", pi).setViewName("user/EventList");
		} else { 
			throw new EventException("이벤트 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping(value="edetail.ev" ,method=RequestMethod.GET) 
	public ModelAndView eventDeatil(@RequestParam("eventNo")int eventNo, ModelAndView mv) {
	
		Event event = eService.eventDetail(eventNo);
		
		if(event != null) {
			mv.addObject("event", event).setViewName("user/EventDetail");
		}else {
			throw new EventException("이벤트 상세 조회에 실패하였습니다.");
		}
		System.out.println(event);
		return mv;
	}
	
	@RequestMapping(value="insertEventView.ev", method=RequestMethod.GET) 
		public String insertEventView() {
		return "admin/InsertEvent";
	}
	
	@RequestMapping(value="insertEvent.ev", method=RequestMethod.POST)
	public String insertEvent(@ModelAttribute Event event, @RequestParam("eventImg") MultipartFile[] eventImg,
										MultipartHttpServletRequest request) {
		
		System.out.println(event);
	if(ServletFileUpload.isMultipartContent(request))	{
//		savaFile(eventImg, request);
	};
	
	int result = eService.insertEvent(event);
	
		if(result > 0 ) {
			return "redirect:eventList.ev";
		} 
	
			
		return "user/EventList";
	}
	
	private String savaFile(MultipartFile eventImg, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";

		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHssSSS");
		String originFileName = eventImg.getOriginalFilename(); 
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "/" + renameFileName;
		
			try {
				eventImg.transferTo(new File(renamePath));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}
		
		
		return renameFileName;
		
	}

	
}
