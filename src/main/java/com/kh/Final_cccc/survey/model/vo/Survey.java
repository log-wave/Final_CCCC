package com.kh.Final_cccc.survey.model.vo;

public class Survey {
	private int survey_no;
	private String survey_one;
	private String survey_two;
	private String survey_three;
	private String survey_four;
	private String survey_five;
	private int user_no;
	
	
	public Survey() {}


	public Survey(int survey_no, String survey_one, String survey_two, String survey_three, String survey_four,
			String survey_five, int user_no) {
		super();
		this.survey_no = survey_no;
		this.survey_one = survey_one;
		this.survey_two = survey_two;
		this.survey_three = survey_three;
		this.survey_four = survey_four;
		this.survey_five = survey_five;
		this.user_no = user_no;
	}


	public int getSurvey_no() {
		return survey_no;
	}


	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}


	public String getSurvey_one() {
		return survey_one;
	}


	public void setSurvey_one(String survey_one) {
		this.survey_one = survey_one;
	}


	public String getSurvey_two() {
		return survey_two;
	}


	public void setSurvey_two(String survey_two) {
		this.survey_two = survey_two;
	}


	public String getSurvey_three() {
		return survey_three;
	}


	public void setSurvey_three(String survey_three) {
		this.survey_three = survey_three;
	}


	public String getSurvey_four() {
		return survey_four;
	}


	public void setSurvey_four(String survey_four) {
		this.survey_four = survey_four;
	}


	public String getSurvey_five() {
		return survey_five;
	}


	public void setSurvey_five(String survey_five) {
		this.survey_five = survey_five;
	}


	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "Survey [survey_no=" + survey_no + ", survey_one=" + survey_one + ", survey_two=" + survey_two
				+ ", survey_three=" + survey_three + ", survey_four=" + survey_four + ", survey_five=" + survey_five
				+ ", user_no=" + user_no + "]";
	}
}
