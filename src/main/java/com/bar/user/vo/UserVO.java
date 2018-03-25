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
