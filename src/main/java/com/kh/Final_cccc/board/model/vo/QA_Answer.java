package com.kh.Final_cccc.board.model.vo;
// 주석
import java.sql.Date;

public class QA_Answer {
	private int qa_No;
	private int bNo;
	private Date As_Create_Date;
	private String Answer_Content;
	
	public QA_Answer() {}

	public QA_Answer(int qa_No, int bNo, Date as_Create_Date, String answer_Content) {
		super();
		this.qa_No = qa_No;
		this.bNo = bNo;
		As_Create_Date = as_Create_Date;
		Answer_Content = answer_Content;
	}

	public int getQa_No() {
		return qa_No;
	}

	public void setQa_No(int qa_No) {
		this.qa_No = qa_No;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public Date getAs_Create_Date() {
		return As_Create_Date;
	}

	public void setAs_Create_Date(Date as_Create_Date) {
		As_Create_Date = as_Create_Date;
	}

	public String getAnswer_Content() {
		return Answer_Content;
	}

	public void setAnswer_Content(String answer_Content) {
		Answer_Content = answer_Content;
	}

	@Override
	public String toString() {
		return "QA_Answer [qa_No=" + qa_No + ", bNo=" + bNo + ", As_Create_Date=" + As_Create_Date + ", Answer_Content="
				+ Answer_Content + "]";
	}
}
