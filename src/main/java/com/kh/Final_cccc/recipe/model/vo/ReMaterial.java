package com.kh.Final_cccc.recipe.model.vo;

public class ReMaterial {
	//레시피당 재료 클래스 
	private int RM_no;
	private int material_no;
	private int recipe_no;
	
	public ReMaterial() {}

	public ReMaterial(int rM_no, int material_no, int recipe_no) {
		super();
		RM_no = rM_no;
		this.material_no = material_no;
		this.recipe_no = recipe_no;
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

	@Override
	public String toString() {
		return "ReMaterial [RM_no=" + RM_no + ", material_no=" + material_no + ", recipe_no=" + recipe_no + "]";
	}
	
	
}
