package com.kh.Final_cccc.Event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.Event.model.vo.Event;
import com.kh.Final_cccc.Event.model.vo.PageInfo;

@Repository("edao")
public class EventDAO {

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return(ArrayList)sqlSession.selectList("eventMapper.selectEventList" , null , rowBounds);
	}

	public Event eventDetail(SqlSessionTemplate sqlSession, int eventNo) {
		return sqlSession.selectOne("eventMapper.eventDetail", eventNo);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, Event event) {
		return sqlSession.insert("eventMapper.insertEvent", event);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.getListCount");
	}
	
}
