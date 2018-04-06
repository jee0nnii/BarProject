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
	private char sex;
	@NotEmpty(message = "생년월일 :: * 필수입력값!!")
	private String birthday; //생년월일
	
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	
	
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
	//0405
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
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
	public String getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}
	public String getBirthMonth() {
		return birthMonth;
	}
	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	
	
}
