package com.kh.Final_cccc.Event.model.service;

import java.util.ArrayList;

import com.kh.Final_cccc.Event.model.vo.Event;


public interface EventService {

	//int getListCount();  페이징 처리
	
	ArrayList<Event> selectEventList();
	
	
}
