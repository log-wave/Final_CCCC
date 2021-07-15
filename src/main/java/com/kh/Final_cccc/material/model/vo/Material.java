package com.kh.Final_cccc.material.model.vo;

public class Material {
	private int materialNo;
	private String materialName;
	private String standard;
	private int kcal;
	private int protein;
	private int fat;
	private int carbo;
	private int sugar;
	private int classFi;
	private String status;
	
	public Material() {}

	public Material(int materialNo, String materialName, String standard, int kcal, int protein, int fat, int carbo,
			int sugar, int classFi, String status) {
		super();
		this.materialNo = materialNo;
		this.materialName = materialName;
		this.standard = standard;
		this.kcal = kcal;
		this.protein = protein;
		this.fat = fat;
		this.carbo = carbo;
		this.sugar = sugar;
		this.classFi = classFi;
		this.status = status;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getCarbo() {
		return carbo;
	}

	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getClassFi() {
		return classFi;
	}

	public void setClassFi(int classFi) {
		this.classFi = classFi;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Material [materialNo=" + materialNo + ", materialName=" + materialName + ", standard=" + standard
				+ ", kcal=" + kcal + ", protein=" + protein + ", fat=" + fat + ", carbo=" + carbo + ", sugar=" + sugar
				+ ", classFi=" + classFi + ", status=" + status + "]";
	}
	
}