package com.bar.beer.vo;

import com.bar.user.vo.UserVO;

public class BeerVO {

	private int beerId;
	private String beerNameKor;
	private String beerNameEng;
	private String beerCountry; 
	
	private String beerTypeFullname;
	
	private String beerVolume;
	private String beerTemp;
	private int beerLike;
	private String beerImg;

	
	private BeerTypeVO beerTypeVO;
	private int beerTypeId;  
	private String beerTypeName;
	
	public String getBeerTypeName() {
		return beerTypeName;
	}

	public void setBeerTypeName(String beerTypeName) {
		this.beerTypeName = beerTypeName;
	}

	private BeerTasteVO beerTasteVO;
	private int beerTasteId;
	
	public BeerTypeVO getBeerTypeVO() {
		return beerTypeVO;
	}

	public void setBeerTypeVO(BeerTypeVO beerTypeVO) {
		this.beerTypeVO = beerTypeVO;
	}

	public BeerTasteVO getBeerTasteVO() {
		return beerTasteVO;
	}

	public void setBeerTasteVO(BeerTasteVO beerTasteVO) {
		this.beerTasteVO = beerTasteVO;
	}

	private UserVO userVO;

	public int getBeerId() {
		return beerId;
	}

	public void setBeerId(int beerId) {
		this.beerId = beerId;
	}

	public String getBeerNameKor() {
		return beerNameKor;
	}

	public void setBeerNameKor(String beerNameKor) {
		this.beerNameKor = beerNameKor;
	}

	public String getBeerNameEng() {
		return beerNameEng;
	}

	public void setBeerNameEng(String beerNameEng) {
		this.beerNameEng = beerNameEng;
	}

	public String getBeerCountry() {
		return beerCountry;
	}

	public void setBeerCountry(String beerCountry) {
		this.beerCountry = beerCountry;
	}


	public String getBeerTypeFullname() {
		return beerTypeFullname;
	}

	public void setBeerTypeFullname(String beerTypeFullname) {
		this.beerTypeFullname = beerTypeFullname;
	}

	public String getBeerVolume() {
		return beerVolume;
	}

	public void setBeerVolume(String beerVolume) {
		this.beerVolume = beerVolume;
	}

	public String getBeerTemp() {
		return beerTemp;
	}

	public void setBeerTemp(String beerTemp) {
		this.beerTemp = beerTemp;
	}

	public int getBeerLike() {
		return beerLike;
	}

	public void setBeerLike(int beerLike) {
		this.beerLike = beerLike;
	}

	public String getBeerImg() {
		return beerImg;
	}

	public void setBeerImg(String beerImg) {
		this.beerImg = beerImg;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public int getBeerTypeId() {
		return beerTypeId;
	}

	public void setBeerTypeId(int beerTypeId) {
		this.beerTypeId = beerTypeId;
	}

	public int getBeerTasteId() {
		return beerTasteId;
	}

	public void setBeerTasteId(int beerTasteId) {
		this.beerTasteId = beerTasteId;
	}
	
	
	
}
