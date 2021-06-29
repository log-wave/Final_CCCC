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

import com.kh.Final_cccc.Event.model.service.EventService;
import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.common.Files;

import oracle.net.aso.b;

@Controller
public class EventController {
	
	@Autowired
		private EventService eService;
	
	@RequestMapping(value="eventList.ev" , method=RequestMethod.GET)
	public ModelAndView EventList(ModelAndView mv) {
		
		ArrayList<Event> elist = eService.selectEventList();
			
		if(elist != null) {
			mv.addObject("elist", elist).setViewName("user/EventList");
		} 
		return mv;
	}
	
	@RequestMapping(value="edetail.ev" ,method=RequestMethod.GET) 
	public ModelAndView eventDeatil(@RequestParam("eventNo")int eventNo, ModelAndView mv) {
	
		Event event = eService.eventDetail(eventNo);
		
		if(event != null) {
			mv.addObject("event", event).setViewName("user/EventDetail");
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
		savaFile(eventImg, request);
	};
	
	int result = eService.insertEvent(event);
	
		if(result > 0 ) {
			return "redirect:eventList.ev";
		} 
	
			
		return "user/EventList";
	}
	
	private ArrayList<String> savaFile(MultipartFile[] eventImg, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";

		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		ArrayList<String> originFileName = new ArrayList<String>();   	
		ArrayList<String> renameFileName = new ArrayList<String>();	

		
		for(int i=0; i<eventImg.length; i++) {
			originFileName.add(eventImg[i].getOriginalFilename()); 
			
			System.out.println("기존 파일명 : "+ originFileName); 
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHssSSS" + i);
			renameFileName.add(sdf.format(new Date(System.currentTimeMillis()))
					+"." + eventImg[i].getOriginalFilename().substring(originFileName.lastIndexOf(".") + 1));
			
			System.out.println("새로운 파일명 : " + renameFileName);
			String renamePath = folder + "/" + renameFileName;
		
			try {
				eventImg[i].transferTo(new File(renamePath));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}
		}
		
		ArrayList<Files> filesList = new ArrayList<Files>();	
		for(int i = 0; i<eventImg.length; i++){
		Files files = new Files();
		files.setFilePath(savePath);
		files.setFileName(originFileName.get(i));
		files.setChangeName(renameFileName.get(i));
		files.setRefFlag(2);
		
		if( i == originFileName.size() - 1) {
			files.setFileYn("N");
			} else {
				files.setFileYn("Y");
			}
			filesList.add(files);
			
		}
		
		System.out.println(filesList);
		
		return renameFileName;
		
	}

	
}
