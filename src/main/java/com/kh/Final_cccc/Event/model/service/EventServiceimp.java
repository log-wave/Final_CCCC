package com.kh.Final_cccc.Event.model.service;

import java.util.ArrayList;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.Event.model.dao.EventDAO;
import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.Event.model.vo.PageInfo;

@Service("eService")
public class EventServiceimp implements EventService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EventDAO edao;
	
	

	@Override
	public Event eventDetail(int eventNo) {
		return edao.eventDetail(sqlSession, eventNo);
	}

	@Override
	public int insertEvent(Event event) {
		return edao.insertEvent(sqlSession, event);
	}

	@Override
	public int getListCount() {
		return edao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Event> selectEventList(PageInfo pi) {
		return edao.selectEventList(sqlSession, pi);
	}

	@Override
	public ArrayList<Event> selectAdminEventList(com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		return edao.selectAdminEventList(sqlSession, pi);
	}

	@Override
	public int updateEvent(Event event) {
		return edao.updateAdminEventUpdate(sqlSession, event);
	}

	

	
	
}
		