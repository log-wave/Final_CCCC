package com.kh.Final_cccc.recipe.model.vo;

public class RecipeProcess {
//조리과정 클래스
	private int rp_no;
	private String rp_comment;
	private int recipe_no;
	
	public RecipeProcess() {}

	public RecipeProcess(int rp_no, String rp_comment, int recipe_no) {
		super();
		this.rp_no = rp_no;
		this.rp_comment = rp_comment;
		this.recipe_no = recipe_no;
	}

	public int getRp_no() {
		return rp_no;
	}

	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}

	public String getRp_comment() {
		return rp_comment;
	}

	public void setRp_comment(String rp_comment) {
		this.rp_comment = rp_comment;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	@Override
	public String toString() {
		return "RecipeProcess [rp_no=" + rp_no + ", rp_comment=" + rp_comment + ", recipe_no=" + recipe_no + "]";
	}
	
	
}
