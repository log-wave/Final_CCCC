package com.kh.Final_cccc.recipe.model.vo;

import java.sql.Date;

public class Reply {
	private int reply_no;
	private String reply_content;
	private Date reply_create_date;
	private int user_no;
	private int recipe_no;
	private String reply_nick;
	
	public Reply() {}
	
	public String getReply_nick() {
		return reply_nick;
	}

	public void setReply_nick(String reply_nick) {
		this.reply_nick = reply_nick;
	}

	public Reply(int reply_no, String reply_content, Date reply_create_date, int user_no, int recipe_no,
			String reply_nick) {
		super();
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.reply_create_date = reply_create_date;
		this.user_no = user_no;
		this.recipe_no = recipe_no;
		this.reply_nick = reply_nick;
	}

	public Reply(String reply_content, int user_no, int recipe_no) {
		super();
		this.reply_content = reply_content;
		this.user_no = user_no;
		this.recipe_no = recipe_no;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_create_date() {
		return reply_create_date;
	}

	public void setReply_create_date(Date reply_create_date) {
		this.reply_create_date = reply_create_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	@Override
	public String toString() {
		return "Reply [reply_no=" + reply_no + ", reply_content=" + reply_content + ", reply_create_date="
				+ reply_create_date + ", user_no=" + user_no + ", recipe_no=" + recipe_no + ", reply_nick=" + reply_nick
				+ "]";
	}

	
	
}
