package com.bar.beer.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.beer.vo.BeerPageVO;
import com.bar.beer.vo.BeerVO;

public class BeerDaoImplForOracle extends SqlSessionDaoSupport implements BeerDAO{

	/*@Override
	public List<BeerVO> selectAll() {
		return getSqlSession().selectList("BeerDAO.selectAll");		
	}*/
	
	//페이징처리 부분
	@Override
	public List<BeerVO> selecAll(BeerPageVO beerPageVO) {
		return getSqlSession().selectList("BeerDAO.selectAll",beerPageVO);
	}

	@Override
	public int selectCountAll(BeerPageVO beerPageVO) {
		return getSqlSession().selectOne("BeerDAO.selectCountAll",beerPageVO);
	}
	
	@Override
	public BeerVO selectOne(int beerId) {
		return getSqlSession().selectOne("BeerDAO.selectOne", beerId);
	}


	

	
}
