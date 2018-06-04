package com.bar.admin.vo;

import com.bar.beer.vo.BeerVO;
import com.bar.user.vo.UserVO;

public class AdminVO {
	/*
	이렇게 받을 필요없이 그냥 member에서 admin으로 가입하기?
	private int adminId;
	private String adminEmail;
	private String adminPwd;*/
	
	/*
	 * 관리자 페이지에서 할 거
	 * 1. 맥주 등록
	 * 2. 문의사항 답글 달기
	 * 3. 행사 등록
	 */
	
	private UserVO userVO;
	private BeerVO beerVO;
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public BeerVO getBeerVO() {
		return beerVO;
	}
	public void setBeerVO(BeerVO beerVO) {
		this.beerVO = beerVO;
	}
	
	
}
