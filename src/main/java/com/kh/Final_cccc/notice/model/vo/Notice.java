package com.kh.Final_cccc.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int Board_No;
	private String Board_Title;
	private String Board_Content;
	private Date Board_Create_Date;
	private Date Board_Modify_Date;
	private int Board_View;
	private String Board_Status;
	private int Board_Flag;
	private int User_No;
	
	public Notice() {
		
	}

	public Notice(int board_No, String board_Title, String board_Content, Date board_Create_Date,
			Date board_Modify_Date, int board_View, String board_Status, int board_Flag, int user_No) {
		super();
		Board_No = board_No;
		Board_Title = board_Title;
		Board_Content = board_Content;
		Board_Create_Date = board_Create_Date;
		Board_Modify_Date = board_Modify_Date;
		Board_View = board_View;
		Board_Status = board_Status;
		Board_Flag = board_Flag;
		User_No = user_No;
	}

	public int getBoard_No() {
		return Board_No;
	}

	public void setBoard_No(int board_No) {
		Board_No = board_No;
	}

	public String getBoard_Title() {
		return Board_Title;
	}

	public void setBoard_Title(String board_Title) {
		Board_Title = board_Title;
	}

	public String getBoard_Content() {
		return Board_Content;
	}

	public void setBoard_Content(String board_Content) {
		Board_Content = board_Content;
	}

	public Date getBoard_Create_Date() {
		return Board_Create_Date;
	}

	public void setBoard_Create_Date(Date board_Create_Date) {
		Board_Create_Date = board_Create_Date;
	}

	public Date getBoard_Modify_Date() {
		return Board_Modify_Date;
	}

	public void setBoard_Modify_Date(Date board_Modify_Date) {
		Board_Modify_Date = board_Modify_Date;
	}

	public int getBoard_View() {
		return Board_View;
	}

	public void setBoard_View(int board_View) {
		Board_View = board_View;
	}

	public String getBoard_Status() {
		return Board_Status;
	}

	public void setBoard_Status(String board_Status) {
		Board_Status = board_Status;
	}

	public int getBoard_Flag() {
		return Board_Flag;
	}

	public void setBoard_Flag(int board_Flag) {
		Board_Flag = board_Flag;
	}

	public int getUser_No() {
		return User_No;
	}

	public void setUser_No(int user_No) {
		User_No = user_No;
	}

	@Override
	public String toString() {
		return "Notice [Board_No=" + Board_No + ", Board_Title=" + Board_Title + ", Board_Content=" + Board_Content
				+ ", Board_Create_Date=" + Board_Create_Date + ", Board_Modify_Date=" + Board_Modify_Date
				+ ", Board_View=" + Board_View + ", Board_Status=" + Board_Status + ", Board_Flag=" + Board_Flag
				+ ", User_No=" + User_No + "]";
	}
}
