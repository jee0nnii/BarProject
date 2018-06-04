package com.bar.user.vo;

import java.util.List;

import com.bar.beer.vo.BeerTasteVO;

public class UserFavTasteVO {

	private int id;
	private int beerTasteId;
	private List<Integer> beerTasteIdList;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBeerTasteId() {
		return beerTasteId;
	}

	public void setBeerTasteId(int beerTasteId) {
		this.beerTasteId = beerTasteId;
	}

	public List<Integer> getBeerTasteIdList() {
		return beerTasteIdList;
	}

	public void setBeerTasteIdList(List<Integer> beerTasteIdList) {
		this.beerTasteIdList = beerTasteIdList;
	}

	private UserVO userVO;
	private BeerTasteVO beerTasteVO;

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public BeerTasteVO getBeerTasteVO() {
		return beerTasteVO;
	}

	public void setBeerTasteVO(BeerTasteVO beerTasteVO) {
		this.beerTasteVO = beerTasteVO;
	}

}
