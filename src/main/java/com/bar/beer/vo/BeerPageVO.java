package com.bar.beer.vo;

import web.pager.annotations.EndRow;
import web.pager.annotations.StartRow;

public class BeerPageVO {

	private int pageNo =  -1;
	
	@StartRow
	private int startNumber;
	@EndRow
	private int endNumber;
	
	//searchType : 맥주이름 가지고만 할 거 같은데
	private int searchType;
	private String searchKeyword;
	
	public int getSearchType() {
		return searchType;
	}
	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStartNumber() {
		return startNumber;
	}
	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}
	public int getEndNumber() {
		return endNumber;
	}
	public void setEndNumber(int endNumber) {
		this.endNumber = endNumber;
	}
	
	
}
