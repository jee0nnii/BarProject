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
	public List<BeerVO> selectAll(BeerPageVO beerPageVO) {
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

	@Override
	public int incrementBeerLike(int beerId) {
		return getSqlSession().update("BeerDAO.incrementBeerLike", beerId);
	}

	@Override
	public List<BeerVO> selectFromTaste(int beerTasteId) {
		return getSqlSession().selectList("BeerDAO.selectFromTaste", beerTasteId);
	}

	@Override
	public List<BeerVO> selectFromType(int beerTypeId) {
		return getSqlSession().selectList("BeerDAO.selectFromType", beerTypeId);
	}
	
}
