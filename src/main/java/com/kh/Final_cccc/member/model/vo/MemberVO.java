package com.kh.Final_cccc.member.model.vo;

import java.sql.Date;

public class MemberVO {
	
	private int user_no;
	private String user_id;
	private String user_password;
	private String nickname;
	private String email;
	private String gender;
	private int age;
	private Date user_date;
	private String authority;
	private String status;
	private String survey_yn;
	private String user_name;
	
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MemberVO(int user_no, String user_id, String user_password, String nickname, String email, String gender,
			int age, Date user_date, String authority, String status, String survey_yn, String user_name) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.user_date = user_date;
		this.authority = authority;
		this.status = status;
		this.survey_yn = survey_yn;
		this.user_name = user_name;
	}
	
	
	public MemberVO(String user_id, String user_password) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getUser_date() {
		return user_date;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
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
	
}
	
	
