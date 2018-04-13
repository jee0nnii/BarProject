package com.bar.beer.service;

import java.util.List;

import com.bar.beer.vo.BeerEvalVO;

public interface BeerEvalService {

	public List<BeerEvalVO> readAllEvals(int beerId);
	public boolean createEval(BeerEvalVO beerEvalVO);
	public BeerEvalVO readOneEval(int beerEvalId);
	
}
