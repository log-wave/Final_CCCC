package com.kh.Final_cccc.Event.model.vo;

import java.sql.Date;

public class Event {
	private int eventNo;
	private String eventContent;
	private String eventStatus;
	private int userNo;
	private String eventTitle;
	private Date eventStart;
	private Date eventEnd;
	private Date eventCreateDate;
	private Date eventModifyDate;

	public Event() {}

	public Event(int eventNo, String eventContent, String eventStatus, int userNo, String eventTitle, Date eventStart,
			Date eventEnd, Date eventCreateDate, Date eventModifyDate) {
		super();
		this.eventNo = eventNo;
		this.eventContent = eventContent;
		this.eventStatus = eventStatus;
		this.userNo = userNo;
		this.eventTitle = eventTitle;
		this.eventStart = eventStart;
		this.eventEnd = eventEnd;
		this.eventCreateDate = eventCreateDate;
		this.eventModifyDate = eventModifyDate;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Date getEventStart() {
		return eventStart;
	}

	public void setEventStart(Date eventStart) {
		this.eventStart = eventStart;
	}

	public Date getEventEnd() {
		return eventEnd;
	}

	public void setEventEnd(Date eventEnd) {
		this.eventEnd = eventEnd;
	}

	public Date getEventCreateDate() {
		return eventCreateDate;
	}

	public void setEventCreateDate(Date eventCreateDate) {
		this.eventCreateDate = eventCreateDate;
	}

	public Date getEventModifyDate() {
		return eventModifyDate;
	}

	public void setEventModifyDate(Date eventModifyDate) {
		this.eventModifyDate = eventModifyDate;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventContent=" + eventContent + ", eventStatus=" + eventStatus
				+ ", userNo=" + userNo + ", eventTitle=" + eventTitle + ", eventStart=" + eventStart + ", eventEnd="
				+ eventEnd + ", eventCreateDate=" + eventCreateDate + ", eventModifyDate=" + eventModifyDate + "]";
	}

	
	
	

}