package com.bar.beer.service;

import java.util.List;

import com.bar.beer.dao.BeerDAO;
import com.bar.beer.vo.BeerVO;

public class BeerServiceImpl implements BeerService{
	
	private BeerDAO beerDao;
	
	public void setBeerDao(BeerDAO beerDao) {
		this.beerDao = beerDao;
	}
	
	@Override
	public List<BeerVO> getAll() {
		return beerDao.selectAll();
	}

	
}
