package com.kh.Final_cccc.recipe.model.vo;

public class ReMaterial {
	//레시피당 재료 클래스 
	private int RM_no;
	private int material_no;
	private int recipe_no;
	private String material_name;
	private String standard;
	private int protein;
	private int kcal;
	private int fat;
	private int carbo;
	private int sugar;
	
	public ReMaterial() {}

	public ReMaterial(int rM_no, int material_no, int recipe_no, String material_name, String standard, int protein,
			int kcal, int fat, int carbo, int sugar) {
		super();
		RM_no = rM_no;
		this.material_no = material_no;
		this.recipe_no = recipe_no;
		this.material_name = material_name;
		this.standard = standard;
		this.protein = protein;
		this.kcal = kcal;
		this.fat = fat;
		this.carbo = carbo;
		this.sugar = sugar;
	}

	public int getRM_no() {
		return RM_no;
	}

	public void setRM_no(int rM_no) {
		RM_no = rM_no;
	}

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
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

	@Override
	public String toString() {
		return "ReMaterial [RM_no=" + RM_no + ", material_no=" + material_no + ", recipe_no=" + recipe_no
				+ ", material_name=" + material_name + ", standard=" + standard + ", protein=" + protein + ", kcal="
				+ kcal + ", fat=" + fat + ", carbo=" + carbo + ", sugar=" + sugar + "]";
	}

	
}
