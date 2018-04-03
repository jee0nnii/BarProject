package com.bar.user.vo;

import javax.validation.constraints.NotEmpty;

public class UserVO {
	private int id;	//회원고유번호
	@NotEmpty(message = "이름 :: * 필수입력값!!")
	private String name; //이름
	@NotEmpty(message = "닉네임 :: * 필수입력값!!")
	private String nickname; //닉네임
	@NotEmpty(message = "이메일 :: * 필수입력값!!")
	private String email; //이메일
	@NotEmpty(message = "비밀번호 :: * 필수입력값!!")
	private String password; //비밀번호
	private String registDate; //가입일자
	@NotEmpty(message = "생년월일 :: * 필수입력값!!")
	private String birthday; //생년월일
	
	//0328 날짜
	private String startDate;
	private String startDateYear;
	private String startDateMonth;
	private String startDateDate;
	
	private String endDate;
	private String endDateYear;
	private String endDateMonth;
	private String endDateDate;
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartDateYear() {
		return startDateYear;
	}
	public void setStartDateYear(String startDateYear) {
		this.startDateYear = startDateYear;
	}
	public String getStartDateMonth() {
		return startDateMonth;
	}
	public void setStartDateMonth(String startDateMonth) {
		this.startDateMonth = startDateMonth;
	}
	public String getStartDateDate() {
		return startDateDate;
	}
	public void setStartDateDate(String startDateDate) {
		this.startDateDate = startDateDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndDateYear() {
		return endDateYear;
	}
	public void setEndDateYear(String endDateYear) {
		this.endDateYear = endDateYear;
	}
	public String getEndDateMonth() {
		return endDateMonth;
	}
	public void setEndDateMonth(String endDateMonth) {
		this.endDateMonth = endDateMonth;
	}
	public String getEndDateDate() {
		return endDateDate;
	}
	public void setEndDateDate(String endDateDate) {
		this.endDateDate = endDateDate;
	}
	//0325 암호화
	private String salt;
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	//0325 암호화
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	
}
