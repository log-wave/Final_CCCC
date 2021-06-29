package com.kh.Final_cccc.common;

import java.sql.Date;


public class Files {
	private int fileNo;
	private String fileName;
	private String changeName;
	private String filePath;
	private Date uplodDate;
	private String fileYn;
	private int refNo;
	private int refFlag;

	public Files() {}

	public Files(int fileNo, String fileName, String changeName, String filePath, Date uplodDate, String fileYn,
			int refNo, int refFlag) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uplodDate = uplodDate;
		this.fileYn = fileYn;
		this.refNo = refNo;
		this.refFlag = refFlag;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String string) {
		this.changeName = string;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUplodDate() {
		return uplodDate;
	}

	public void setUplodDate(Date uplodDate) {
		this.uplodDate = uplodDate;
	}

	public String getFileYn() {
		return fileYn;
	}

	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public int getRefFlag() {
		return refFlag;
	}

	public void setRefFlag(int refFlag) {
		this.refFlag = refFlag;
	}

	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", fileName=" + fileName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uplodDate=" + uplodDate + ", fileYn=" + fileYn + ", refNo=" + refNo + ", refFlag="
				+ refFlag + "]";
	}
	
	
}

