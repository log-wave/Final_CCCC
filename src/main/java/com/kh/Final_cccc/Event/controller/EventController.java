package com.kh.Final_cccc.Event.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.Event.model.service.EventService;
import com.kh.Final_cccc.Event.model.vo.Event;

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
		
		
}
