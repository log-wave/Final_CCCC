package com.kh.Final_cccc.board.model.vo;
//다시
import java.sql.Date;

public class Board {
	private int bNo;
	private String bTitle;
	private String bContent;
	private Date bCreateDate;
	private Date bModifyDate;
	private int bView;
	private String bStatus;
	private int bFlag;
	private int bUserNo;
	private String nickName;
	
	public Board() {
		
	}

	public Board(int bNo, String bTitle, String bContent, Date bCreateDate, Date bModifyDate, int bView, String bStatus,
			int bFlag, int bUserNo, String nickName) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bView = bView;
		this.bStatus = bStatus;
		this.bFlag = bFlag;
		this.bUserNo = bUserNo;
		this.nickName = nickName;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public int getbView() {
		return bView;
	}

	public void setbView(int bView) {
		this.bView = bView;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int getbFlag() {
		return bFlag;
	}

	public void setbFlag(int bFlag) {
		this.bFlag = bFlag;
	}

	public int getbUserNo() {
		return bUserNo;
	}

	public void setbUserNo(int bUserNo) {
		this.bUserNo = bUserNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bCreateDate=" + bCreateDate
				+ ", bModifyDate=" + bModifyDate + ", bView=" + bView + ", bStatus=" + bStatus + ", bFlag=" + bFlag
				+ ", bUserNo=" + bUserNo + ", nickName=" + nickName + "]";
	}
}
