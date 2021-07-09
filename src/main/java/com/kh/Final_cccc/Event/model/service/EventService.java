package com.kh.Final_cccc.Event.model.service;

import java.util.ArrayList;


import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.Event.model.vo.PageInfo;



public interface EventService {

	
	ArrayList<Event> selectEventList(PageInfo pi);

	Event eventDetail(int eventNo);

	int insertEvent(Event event);

	int getListCount();

	ArrayList<Event> selectAdminEventList(com.kh.Final_cccc.admin.model.vo.PageInfo pi);


	
	
}
