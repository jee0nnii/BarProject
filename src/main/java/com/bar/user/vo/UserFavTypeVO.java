package com.bar.user.vo;

import java.util.List;

import com.bar.beer.vo.BeerTypeVO;

public class UserFavTypeVO {

	private int id;
	private int beerTypeId;
	private List<Integer> beerTypeIdList;
	
	public int getId() {
		return id;
	}
	public List<Integer> getBeerTypeIdList() {
		return beerTypeIdList;
	}
	public void setBeerTypeIdList(List<Integer> beerTypeIdList) {
		this.beerTypeIdList = beerTypeIdList;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBeerTypeId() {
		return beerTypeId;
	}
	public void setBeerTypeId(int beerTypeId) {
		this.beerTypeId = beerTypeId;
	}
	private UserVO userVO;
	private BeerTypeVO beerTypeVO;
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public BeerTypeVO getBeerTypeVO() {
		return beerTypeVO;
	}
	public void setBeerTypeVO(BeerTypeVO beerTypeVO) {
		this.beerTypeVO = beerTypeVO;
	}
	
	
	
}
