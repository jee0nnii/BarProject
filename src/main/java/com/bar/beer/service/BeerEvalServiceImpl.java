package com.bar.beer.service;

import java.util.List;

import com.bar.beer.dao.BeerEvalDAO;
import com.bar.beer.vo.BeerEvalVO;

public class BeerEvalServiceImpl implements BeerEvalService{

	private BeerEvalDAO beerEvalDao;
	
	public void setBeerEvalDao(BeerEvalDAO beerEvalDao) {
		this.beerEvalDao = beerEvalDao;
	}
	
	@Override
	public List<BeerEvalVO> readAllEvals(int beerId) {
		return beerEvalDao.selectAllEvals(beerId);
	}

	@Override
	public boolean createEval(BeerEvalVO beerEvalVO) {
		return beerEvalDao.insertEval(beerEvalVO) > 0;
	}

	@Override
	public BeerEvalVO readOneEval(int beerEvalId) {
		return beerEvalDao.selectOneEval(beerEvalId);
	}

}
