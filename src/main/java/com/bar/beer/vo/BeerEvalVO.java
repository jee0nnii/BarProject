package com.bar.beer.vo;

import com.bar.beer.vo.BeerVO;
import com.bar.user.vo.UserVO;

public class BeerEvalVO {

	private int beerEvalId;
	private int beerEvalPoint;
	private String beerEvalTalk;
	private int id; //사용자 ID
	private int beerId;
	private String evalRegistDate;
	
	private UserVO userVO;
	private BeerVO beerVO;
	
	public int getBeerEvalId() {
		return beerEvalId;
	}
	public void setBeerEvalId(int beerEvalId) {
		this.beerEvalId = beerEvalId;
	}
	public int getBeerEvalPoint() {
		return beerEvalPoint;
	}
	public void setBeerEvalPoint(int beerEvalPoint) {
		this.beerEvalPoint = beerEvalPoint;
	}
	public String getBeerEvalTalk() {
		return beerEvalTalk;
	}
	public void setBeerEvalTalk(String beerEvalTalk) {
		this.beerEvalTalk = beerEvalTalk;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBeerId() {
		return beerId;
	}
	public void setBeerId(int beerId) {
		this.beerId = beerId;
	}
	public String getEvalRegistDate() {
		return evalRegistDate;
	}
	public void setEvalRegistDate(String evalRegistDate) {
		this.evalRegistDate = evalRegistDate;
	}
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
