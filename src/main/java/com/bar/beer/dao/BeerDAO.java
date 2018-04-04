package com.bar.beer.dao;

import java.util.List;

import com.bar.beer.vo.BeerVO;

public interface BeerDAO {

	//리스트 가져오기
	public List<BeerVO> selectAll();
}
