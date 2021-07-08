package com.kh.Final_cccc.member.model.vo;

import java.sql.Date;

public class MemberVO {
	
	private int user_no;
	private String user_id; 
	private String user_password; 
	private String nickname;
	private String email;
	private String gender; 
	private String age; 
	private String authority; 
	private String status;
	private String survey_yn; 
	private String user_name;
	private Date u_cre_date;
	private Date u_mod_date;
	private Date u_del_date;
	private int pass_cnt;
	
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MemberVO(String user_id, String user_password) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
	}


	public MemberVO(int user_no, String user_id, String user_password, String nickname, String email, String gender,
			String age, String authority, String status, String survey_yn, String user_name, Date u_cre_date,
			Date u_mod_date, Date u_del_date, int pass_cnt) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.authority = authority;
		this.status = status;
		this.survey_yn = survey_yn;
		this.user_name = user_name;
		this.u_cre_date = u_cre_date;
		this.u_mod_date = u_mod_date;
		this.u_del_date = u_del_date;
		this.pass_cnt = pass_cnt;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_password() {
		return user_password;
	}


	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getSurvey_yn() {
		return survey_yn;
	}


	public void setSurvey_yn(String survey_yn) {
		this.survey_yn = survey_yn;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public Date getU_cre_date() {
		return u_cre_date;
	}


	public void setU_cre_date(Date u_cre_date) {
		this.u_cre_date = u_cre_date;
	}


	public Date getU_mod_date() {
		return u_mod_date;
	}


	public void setU_mod_date(Date u_mod_date) {
		this.u_mod_date = u_mod_date;
	}


	public Date getU_del_date() {
		return u_del_date;
	}


	public void setU_del_date(Date u_del_date) {
		this.u_del_date = u_del_date;
	}


	public int getPass_cnt() {
		return pass_cnt;
	}


	public void setPass_cnt(int pass_cnt) {
		this.pass_cnt = pass_cnt;
	}


	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", nickname=" + nickname + ", email=" + email + ", gender=" + gender + ", age=" + age + ", authority="
				+ authority + ", status=" + status + ", survey_yn=" + survey_yn + ", user_name=" + user_name
				+ ", u_cre_date=" + u_cre_date + ", u_mod_date=" + u_mod_date + ", u_del_date=" + u_del_date
				+ ", pass_cnt=" + pass_cnt + "]";
	}

	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
}
	
	
