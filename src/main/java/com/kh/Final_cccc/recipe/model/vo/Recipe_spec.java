package com.kh.Final_cccc.recipe.model.vo;

public class Recipe_spec {
	private int rs_no;
	private int recipe_no;
	private int speciality_no;
	private int per_qnt;
	
	public Recipe_spec() {}

	public Recipe_spec(int rs_no, int recipe_no, int speciality_no, int per_qnt) {
		super();
		this.rs_no = rs_no;
		this.recipe_no = recipe_no;
		this.speciality_no = speciality_no;
		this.per_qnt = per_qnt;
	}
	
	
	public Recipe_spec(int speciality_no, int per_qnt) {
		super();
		this.speciality_no = speciality_no;
		this.per_qnt = per_qnt;
	}

	public int getRs_no() {
		return rs_no;
	}

	public void setRs_no(int rs_no) {
		this.rs_no = rs_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public int getSpeciality_no() {
		return speciality_no;
	}

	public void setSpeciality_no(int speciality_no) {
		this.speciality_no = speciality_no;
	}

	public int getPer_qnt() {
		return per_qnt;
	}

	public void setPer_qnt(int per_qnt) {
		this.per_qnt = per_qnt;
	}

	@Override
	public String toString() {
		return "Recipe_spec [rs_no=" + rs_no + ", recipe_no=" + recipe_no + ", speciality_no=" + speciality_no
				+ ", per_qnt=" + per_qnt + "]";
	}
	
	
}
