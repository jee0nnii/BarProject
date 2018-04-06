package com.bar.beer.service;

import com.bar.beer.vo.BeerPageVO;
import com.bar.beer.vo.BeerVO;

import web.pager.explorer.PageExplorer;

public interface BeerService {

	//public List<BeerVO> getAll();
	//페이징처리	
	public PageExplorer getAll(BeerPageVO beerPageVO);
	
	public BeerVO getOne(int beerId);
}
