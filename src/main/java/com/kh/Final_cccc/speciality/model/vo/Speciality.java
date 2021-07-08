package com.kh.Final_cccc.speciality.model.vo;

public class Speciality {
	private int specialityNo;
	private String specialityRegion;
	private String specialityName;
	private String specialityInfo;
	private int materialNo;

	public Speciality() {}

	public Speciality(int specialityNo, String specialityRegion, String specialityName, String specialityInfo,
			int materialNo) {
		super();
		this.specialityNo = specialityNo;
		this.specialityRegion = specialityRegion;
		this.specialityName = specialityName;
		this.specialityInfo = specialityInfo;
		this.materialNo = materialNo;
	}

	public int getSpecialityNo() {
		return specialityNo;
	}

	public void setSpecialityNo(int specialityNo) {
		this.specialityNo = specialityNo;
	}

	public String getSpecialityRegion() {
		return specialityRegion;
	}

	public void setSpecialityRegion(String specialityRegion) {
		this.specialityRegion = specialityRegion;
	}

	public String getSpecialityName() {
		return specialityName;
	}

	public void setSpecialityName(String specialityName) {
		this.specialityName = specialityName;
	}

	public String getSpecialityInfo() {
		return specialityInfo;
	}

	public void setSpecialityInfo(String specialityInfo) {
		this.specialityInfo = specialityInfo;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	@Override
	public String toString() {
		return "Speciality [specialityNo=" + specialityNo + ", specialityRegion=" + specialityRegion
				+ ", specialityName=" + specialityName + ", specialityInfo=" + specialityInfo + ", materialNo="
				+ materialNo + "]";
	}
	
}
