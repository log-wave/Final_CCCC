package com.kh.Final_cccc.Files.vo;

import java.sql.Date;


public class Files {
	private int fileNo;
	private String fileName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String fileYn;
	private int refNo;
	private int refFlag;

	public Files() {}

	public Files(int fileNo, String fileName, String changeName, String filePath, Date uploadDate, String fileYn,
			int refNo, int refFlag) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
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

	public Date getuploadDate() {
		return uploadDate;
	}

	public void setuploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
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
		return "Files [fileNo=" + fileNo + ", fileName=" + fileName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", fileYn=" + fileYn + ", refNo=" + refNo + ", refFlag="
				+ refFlag + "]";
	}
	
	
}

