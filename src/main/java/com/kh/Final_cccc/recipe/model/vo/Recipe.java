package com.kh.Final_cccc.recipe.model.vo;

import java.sql.Date;

public class Recipe {
	//레시피 정보 클래스
	private int recipe_no;
	private String recipe_title;
	private String recipe_explain;
	private int cooking_time;
	private int user_no;
	private int material_no;
	private int sort_sub;
	private int sort_mate;
	private int sort_spec;
	private Date recipe_create_date;
	private Date recipe_modify_date;
	private String r_status;
	
	public Recipe() {}

	public Recipe(int recipe_no, String recipe_title, String recipe_explain, int cooking_time, int user_no,
			int material_no, int sort_sub, int sort_mate, int sort_spec, Date recipe_create_date,
			Date recipe_modify_date, String r_status) {
		super();
		this.recipe_no = recipe_no;
		this.recipe_title = recipe_title;
		this.recipe_explain = recipe_explain;
		this.cooking_time = cooking_time;
		this.user_no = user_no;
		this.material_no = material_no;
		this.sort_sub = sort_sub;
		this.sort_mate = sort_mate;
		this.sort_spec = sort_spec;
		this.recipe_create_date = recipe_create_date;
		this.recipe_modify_date = recipe_modify_date;
		this.r_status = r_status;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public String getRecipe_explain() {
		return recipe_explain;
	}

	public void setRecipe_explain(String recipe_explain) {
		this.recipe_explain = recipe_explain;
	}

	public int getCooking_time() {
		return cooking_time;
	}

	public void setCooking_time(int cooking_time) {
		this.cooking_time = cooking_time;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}

	public int getSort_sub() {
		return sort_sub;
	}

	public void setSort_sub(int sort_sub) {
		this.sort_sub = sort_sub;
	}

	public int getSort_mate() {
		return sort_mate;
	}

	public void setSort_mate(int sort_mate) {
		this.sort_mate = sort_mate;
	}

	public int getSort_spec() {
		return sort_spec;
	}

	public void setSort_spec(int sort_spec) {
		this.sort_spec = sort_spec;
	}

	public Date getRecipe_create_date() {
		return recipe_create_date;
	}

	public void setRecipe_create_date(Date recipe_create_date) {
		this.recipe_create_date = recipe_create_date;
	}

	public Date getRecipe_modify_date() {
		return recipe_modify_date;
	}

	public void setRecipe_modify_date(Date recipe_modify_date) {
		this.recipe_modify_date = recipe_modify_date;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	@Override
	public String toString() {
		return "Recipe [recipe_no=" + recipe_no + ", recipe_title=" + recipe_title + ", recipe_explain="
				+ recipe_explain + ", cooking_time=" + cooking_time + ", user_no=" + user_no + ", material_no="
				+ material_no + ", sort_sub=" + sort_sub + ", sort_mate=" + sort_mate + ", sort_spec=" + sort_spec
				+ ", recipe_create_date=" + recipe_create_date + ", recipe_modify_date=" + recipe_modify_date
				+ ", r_status=" + r_status + "]";
	}
	
	
}
