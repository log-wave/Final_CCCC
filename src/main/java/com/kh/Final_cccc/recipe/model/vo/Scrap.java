package com.kh.Final_cccc.recipe.model.vo;

public class Scrap {
	private int scrap_no;
	private int recipe_no;
	private int user_no;
	
	public Scrap() {}

	public Scrap(int scrap_no, int recipe_no, int user_no) {
		super();
		this.scrap_no = scrap_no;
		this.recipe_no = recipe_no;
		this.user_no = user_no;
	}
	
	

	public Scrap(int recipe_no, int user_no) {
		super();
		this.recipe_no = recipe_no;
		this.user_no = user_no;
	}

	public int getScrap_no() {
		return scrap_no;
	}

	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "Scrap [scrap_no=" + scrap_no + ", recipe_no=" + recipe_no + ", user_no=" + user_no + "]";
	}
	
}
