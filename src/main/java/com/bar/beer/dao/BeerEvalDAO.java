package com.bar.beer.dao;

import java.util.List;

import com.bar.beer.vo.BeerEvalVO;

public interface BeerEvalDAO {

	//각 맥주에 대한 평가 전체를 보여줄 거임
	public List<BeerEvalVO> selectAllEvals(int beerId);
	//평가 등록하기
	public int insertEval(BeerEvalVO beerEvalVO);
	//평가 가져와서 보여주기
	public BeerEvalVO selectOneEval(int beerEvalId);
}
