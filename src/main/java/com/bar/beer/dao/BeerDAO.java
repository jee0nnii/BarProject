package com.bar.beer.dao;

import java.util.List;

import com.bar.beer.vo.BeerPageVO;
import com.bar.beer.vo.BeerVO;

public interface BeerDAO {

	//리스트 가져오기
	//public List<BeerVO> selectAll();
	//0406 페이징 처리하기
	public List<BeerVO> selecAll(BeerPageVO beerPageVO);
	public int selectCountAll(BeerPageVO beerPageVO);
	//0406 맥주 하나만 
	public BeerVO selectOne(int beerId);
}
