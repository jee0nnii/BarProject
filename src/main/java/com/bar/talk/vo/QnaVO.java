package com.bar.talk.vo;

import com.bar.user.vo.UserVO;

public class QnaVO {

	private int qnaId;
	private String qnaType;
	private String qnaRegistDate;
	private String qnaTitle;
	private String qnaContents;
	
	private int id; //사용자 아이디
	private String nickname;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	private UserVO userVO;
	public int getQnaId() {
		return qnaId;
	}
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public String getQnaRegistDate() {
		return qnaRegistDate;
	}
	public void setQnaRegistDate(String qnaRegistDate) {
		this.qnaRegistDate = qnaRegistDate;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
	
}
