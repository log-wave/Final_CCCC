package com.kh.Final_cccc.member.model.vo;

/**
 * 본 사이트를 이용하는 사용자들의 정보를 담는 맴버 전용 객체 
 * 
 * @author 임 종 부 
 * @version 1.0.0
 * @since 2021.07.13
 	
 */


import java.sql.Date;
public class MemberVO {
	

	/**
	 * user_no
	 *사용자 계정의 고유 번호 / DB에서 시퀸스 SEQ_USER_NO를 이용하여 자동으로 1씩 증가 
	 */
	private int user_no;
	
	
	/**
	 * user_password 사용자 계정의 비번호
	 */
	private String user_id; 

	/**
	 * 사용자 계정의 비번호
	 */
	
	private String user_password; 

	
	/**
	 * 사용자의 닉네임
	 */
	
	private String nickname;
	
	
	
	/**
	 * 사용자 계정의 이메일 
	 */
	
	
	private String email;
	
	
	/**
	 * 사용자의 성별
	 */
	
	private String gender;
	

	/**
	 * 사용자의 현재 나이 
	 */
	
	private String age;
	
	
	/**
	 * 본 사이트를 이용하는 계정의 권한 / N:회원 , Y: 관리자
	 */
	
	private String authority;
	
	
	/**
	 * 본 사이트를 이용하는 계정의 상태 / N:탈퇴한 회원 , S: 정지된 회원
	 */
	
	private String status;
	

	/**
	 * 설문 조사 참여 여부 / N : 설문조사 미참여 , Y: 설문조사 참여 
	 */
	private String survey_yn; 
	
	
	/**
	 * 사용자의 이름 
	 */
	private String user_name;
	
	
	/**
	 * 계정을 생성한 일자
	 */
	
	private Date u_cre_date;
	
	
	/**
	 * 계정을 수정한 일자 
	 */
	private Date u_mod_date;
	
	
	/**
	 * 계정을 삭제한 일자 
	 */
	private Date u_del_date;
	
	
	/**
	 * 로그인 실패 회수 / 5회 이상 틀릴시 계정 잠금 상태  
	 */
	private int pass_cnt;
	

	/**
	 * MemverVO의 기본 생성자를 생성하는 메서드 
	 */
	
	

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 사용자의 아이디와 비밀번호를 매개변수로 받는 생성자를 생성하는 메서드  
	 */

	public MemberVO(String user_id, String user_password) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
	}

	
	/**
	 * 모든 맴버 변수를 매개변수로 받는 생성자를 생성하는 메서드  
	 */

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

	/**
	 * 사용자 계정의 고유 번호를 반환하는 메서드 
	 * @return user_no 사용자 계정의 고유 번호 
	 */

	public int getUser_no() {
		return user_no;
	}

	/**
	 * @param user_no 사용자 계정의 고유 번호 
	 * 사용자 계정의 고유번호를 설정하는 메서드 
	 *  
	 */
	
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	/**
	 * 사용자 계정의 아이디를 반환하는 메서드 
	 * @return user_id 사용자 계정의 아이디 
	 */
	
	public String getUser_id() {
		return user_id;
	}
	
	/**
	 * @param user_id 사용자 계정의 아이디 
	 * 사용자 계정의 아이디를 설정하는 메서드
	 * 
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	/**
	 * 사용자 계정의 비밀번호를 반환하는 메서드 
	 * @return user_password 사용자 계정의 비밀번호 
	 */
	
	
	public String getUser_password() {
		return user_password;
	}
	
	
	/**
	 * 사용자 계정의 비밀번호를 설정하는 메서드 
	 * @param user_password 사용자 계정의 비밀번호  
	 */

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	/**
	 * 사용자 계정의 닉네임을 반환하는 메서드  
	 * @return nickname 사용자 계정의 닉네임 
	 */

	public String getNickname() {
		return nickname;
	}

	/**
	 * 사용자 계정의 닉네임을 설정하는 메서드  
	 * @param nickname 사용자 계정의 닉네임 
	 */
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * 사용자 계정의 이메일을 반환하는 메서드 
	 * @return email 사용자 계정의 이메일 
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * 사용자 계정의 이메일을 설정하는 메서드
	 * @param email 사용자 계정의 이메일
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * 사용자의 성별을 반환하는 메서드
	 * @return gender 사용자의 성별 
	 */

	public String getGender() {
		return gender;
	}
	
	
	/**
	 * 사용자의 성별을 설정하는 메서드 
	 * @param gender 사용자의 성별 
	 */

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	/**
	 * 사용자의 나이를 반환하는 메서드 
	 * @return age 사용자의 나이 
	 */

	public String getAge() {
		return age;
	}

	/**
	 * 사용자의 나이를 설정하는 메서드 
	 * @param age 사용자의 나이 
	 */
	public void setAge(String age) {
		this.age = age;
	}

	/**
	 * 사용자 계정의 권한 상태를 설정하는 메서드 
	 * @return authority 사용자 계정의 권한 상태 
	 */
	public String getAuthority() {
		return authority;
	}

	/**
	 * 사용자 계정의 권한 상태를 설정하는 메서드  
	 * @param authority 사용자 계정의 권한 상태  
	 */
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	/**
	 * 사용자 계정의 상태 여부를 반환하는 메서드
	 * @return status 사용자 계정의 상태여부 
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * 사용자 계정의 상태를 설정하는 메서드 
	 * @param status 사용자 계정의  상태여부 
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * 사용자의 설문조사 여부를 반환하는 메서드 
	 * @return survey_yn 사용자의 설문조사 여부 
	 */
	public String getSurvey_yn() {
		return survey_yn;
	}

	/**
	 * 사용자의 설문조사 여부를 설정하는 메서드 
	 * @param survey_yn 사용자의 설문조사 여부 
	 */
	public void setSurvey_yn(String survey_yn) {
		this.survey_yn = survey_yn;
	}

	/**
	 * 사용자의 이름을 반환하는 메서드 
	 * @return user_no 사용자 계정의 고유 번호 
	 */
	public String getUser_name() {
		return user_name;
	}

	/**
	 * 사용자의 이름을 설정하는 메서드 
	 * @param user_name 사용자의 이름 
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	/**
	 * 사용자 계정 생성일자를 반환하는 메서드  
	 * @return u_cre_date 사용자 계정의 생성일자 
	 */
	public Date getU_cre_date() {
		return u_cre_date;
	}


	/**
	 * 사용자 계정의 생성일자를 설정하는 메서드 
	 * @param u_cre_date 사용자 계정의 생성일자 
	 */
	public void setU_cre_date(Date u_cre_date) {
		this.u_cre_date = u_cre_date;
	}
	
	/**
	 * 사용자 계정의 수정일자를 반환하는 메서드 
	 * @return u_mod_date 사용자 계정의 수정일자 
	 */
	

	public Date getU_mod_date() {
		return u_mod_date;
	}

	
	/**
	 * 사용자 계정의 수정일자를 설정하는 메서드 
	 * @param u_mod_date 사용자 계정의 수정일자 
	 */
	public void setU_mod_date(Date u_mod_date) {
		this.u_mod_date = u_mod_date;
	}

	/**
	 * 사용자 계정의 삭제일자를 반환하는 메서드 
	 * @return u_del_date 사용자 계정의 삭재일자 
	 */
	public Date getU_del_date() {
		return u_del_date;
	}
	
	/**
	 * 사용자 계정의 삭제일자를 설정하는 메서드
	 * @param u_del_date 사용자 계정의 삭제일자 
	 */

	public void setU_del_date(Date u_del_date) {
		this.u_del_date = u_del_date;
	}

	
	/**
	 * 사용자 계정의 로그인 실패 횟수를 반환하는 메서드
	 * @return pass_cnt 사용자 계정의 로그인 실패 회수 
	 */

	public int getPass_cnt() {
		return pass_cnt;
	}
	
	/**
	 * 사용자 계정의 로그인 실패 횟수를 설정하는 메서드 
	 * @param pass_cnt 사용자 계정의 로그인 실패 횟수 
	 */

	public void setPass_cnt(int pass_cnt) {
		this.pass_cnt = pass_cnt;
	}


	/**
	 * Member 객체의 대푯값들을 반환하는 메서드  
	 * @return Member 객체의 맴버 필드 전원 반환 
	 */
	
	
	
	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", nickname=" + nickname + ", email=" + email + ", gender=" + gender + ", age=" + age + ", authority="
				+ authority + ", status=" + status + ", survey_yn=" + survey_yn + ", user_name=" + user_name
				+ ", u_cre_date=" + u_cre_date + ", u_mod_date=" + u_mod_date + ", u_del_date=" + u_del_date
				+ ", pass_cnt=" + pass_cnt + "]";
	}
	
}
	
	
