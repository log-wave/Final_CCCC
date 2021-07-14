package com.kh.Final_cccc.Event.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.kh.Final_cccc.Event.exception.EventException;
import com.kh.Final_cccc.Event.model.service.EventService;
import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.Event.model.vo.PageInfo;
import com.kh.Final_cccc.Files.service.FilesService;
import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.common.PagenationEvent;

import oracle.net.aso.b;

@Controller
public class EventController {
	
	@Autowired
		private EventService eService;
	
	@Autowired
		private FilesService fService;
	
	@RequestMapping(value="eventList.ev" , method=RequestMethod.GET)
	public ModelAndView EventList(@RequestParam(value="page" , required= false)Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = eService.getListCount();

		PageInfo pi = PagenationEvent.getPageInfo(currentPage, listCount);
		
		ArrayList<Event> elist = eService.selectEventList(pi);
		
		ArrayList<Files> files = fService.selectFileList(pi);
		
		if(elist != null) {
			mv.addObject("elist", elist).addObject("files", files).addObject("pi", pi).setViewName("user/EventList");
		} else { 
			throw new EventException("이벤트 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping(value="edetail.ev" ,method=RequestMethod.GET) 
	public ModelAndView eventDeatil(@RequestParam("eventNo")int eventNo, ModelAndView mv) {
	
		Event event = eService.eventDetail(eventNo);
		
		ArrayList<Files> files = fService.selectFiles(eventNo);
		
		if(event != null) {
			mv.addObject("event", event).addObject("files", files).setViewName("user/EventDetail");
		}else {
			throw new EventException("이벤트 상세 조회에 실패하였습니다.");
		}
		System.out.println(event);
		return mv;
	}
	
	@RequestMapping(value="insertEventView.ev", method=RequestMethod.GET) 
	public String insertEventView() {
		return "../admin/admin_event/InsertEvent";
	}

	@RequestMapping(value="insertEvent.ev", method=RequestMethod.POST)
	public String insertEvent(@ModelAttribute Event event, @RequestParam("eventImg") MultipartFile[] eventImg,
										MultipartHttpServletRequest request, Model model){
	
		
		// 이미지 저장할 경로 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
	
		//디렉토리가 없다면 디렉토리 생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		//날짜를 원하는 형태로 출력 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHssSSS");
		
		ArrayList<String> originFileName = new ArrayList<String>(); 
		ArrayList<String> renameFileName = new ArrayList<String>();
		ArrayList<String > renamePath = new ArrayList<String>();
		
		for(int i = 0; i < eventImg.length; i++) {
			 originFileName.add(eventImg[i].getOriginalFilename());
			 renameFileName.add(sdf.format(new Date(System.currentTimeMillis()))+ originFileName.get(i).substring(originFileName.lastIndexOf(".") + 1));
			 renamePath.add(folder +"/"+ renameFileName.get(i));
			 
			 try {
				 // MultipartFile로 받은 파일을 transferTo( ) 함수를 통해 renamePath()경로에  저장
				eventImg[i].transferTo(new File(renamePath.get(i)));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("originFileName : " + originFileName.get(0));
		System.out.println("originFileName2 : " + originFileName.get(1));
	
		System.out.println("renameFileName : " + renameFileName.get(0));
		System.out.println("renameFileName2 : " + renameFileName.get(1));
		System.out.println(originFileName.size());
		
		int eresult = eService.insertEvent(event);
		
		Event ev = new Event();
		ev.setEventTitle(event.getEventTitle());
		ev.setEventContent(event.getEventContent());
		ev.setEventStart(event.getEventStart());
		ev.setEventEnd(event.getEventEnd());
		
		
		ArrayList<Files> fileList = new ArrayList<Files>();
		
		//for(int i = originFileName.size() - 1; i >=0; i--) {
		for(int i = 0; i <= originFileName.size()-1; i++) {
		Files f = new Files();
		f.setFilePath(savePath);
	
		f.setFileName(originFileName.get(i));
		f.setChangeName(renameFileName.get(i));
	
			if( i == originFileName.size() - 1) {
						f.setFileYn("N");
					} else {
						f.setFileYn("Y");
					}
			
			
				System.out.println("f" + f);
				int fresult = fService.insertFiles(f);
				if(fresult == 0) {
					System.out.println("이벤트이미지 에러남");
					throw new EventException("이벤트 상세 조회에 실패하였습니다.");
				}
		
			}
			
		return  "../admin/blankPage";
	}
	@RequestMapping("updateEventView.ev")
	public ModelAndView updateEventForm(@RequestParam(value="no") String eventNo, ModelAndView mv) {
		int eNo = Integer.parseInt(eventNo);
		Event event = eService.eventDetail(eNo);
		
		ArrayList<Files> files = fService.selectFiles(eNo);
		
		if(event != null) {
			mv.addObject("event", event).addObject("files", files).setViewName("../admin/admin_event/admin_update");
		}else {
			throw new EventException("이벤트 수정 페이지 조회에 실패하였습니다.");
		}
		System.out.println(event);
		return mv;
	}
	
	@RequestMapping(value="updateEvent.ev", method=RequestMethod.POST)
	public String updateEvent(@ModelAttribute Event event, @RequestParam("eventImg") MultipartFile[] eventImg,
										MultipartHttpServletRequest request, Model model, @RequestParam("file_no_0") int file_no_0, 
										@RequestParam("file_no_1") int file_no_1){
	
		// 이미지 저장할 경로 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
	
		//디렉토리가 없다면 디렉토리 생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		//날짜를 원하는 형태로 출력 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHssSSS");
		
		ArrayList<String> originFileName = new ArrayList<String>(); 
		ArrayList<String> renameFileName = new ArrayList<String>();
		ArrayList<String > renamePath = new ArrayList<String>();
		
		for(int i = 0; i < eventImg.length; i++) {
			 originFileName.add(eventImg[i].getOriginalFilename());
			 renameFileName.add(sdf.format(new Date(System.currentTimeMillis()))+ originFileName.get(i).substring(originFileName.lastIndexOf(".") + 1));
			 renamePath.add(folder +"/"+ renameFileName.get(i));
			 
			 try {
				 // MultipartFile로 받은 파일을 transferTo( ) 함수를 통해 renamePath()경로에  저장
				eventImg[i].transferTo(new File(renamePath.get(i)));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("originFileName : " + originFileName.get(0));
		System.out.println("originFileName2 : " + originFileName.get(1));
	
		System.out.println("renameFileName : " + renameFileName.get(0));
		System.out.println("renameFileName2 : " + renameFileName.get(1));
		System.out.println(originFileName.size());
		
		int eresult = eService.updateEvent(event);
		
		Event ev = new Event();
		ev.setEventTitle(event.getEventTitle());
		ev.setEventContent(event.getEventContent());
		ev.setEventStart(event.getEventStart());
		ev.setEventEnd(event.getEventEnd());
		
		
		ArrayList<Files> fileList = new ArrayList<Files>();
		int [] fileNoArr = {file_no_0, file_no_1}; 
		
		//for(int i = originFileName.size() - 1; i >=0; i--) {
		for(int i = 0; i <= originFileName.size()-1; i++) {
		Files f = new Files();
		f.setFileNo(fileNoArr[i]);
		f.setFilePath(savePath);
		f.setRefNo(event.getEventNo());
		f.setFileName(originFileName.get(i));
		f.setChangeName(renameFileName.get(i));
	
			if( i == originFileName.size() - 1) {
				f.setFileYn("N");
			} else {
				f.setFileYn("Y");
			}
			System.out.println("f" + f);
			int fresult = fService.updateFiles(f);
			if(fresult == 0) {
				System.out.println("이벤트이미지 에러남");
				throw new EventException("이벤트 상세 조회에 실패하였습니다.");
			}
		
		}
			
		return  "../admin/blankPage";
	}
}	
