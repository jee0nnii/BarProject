package com.bar.admin.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.admin.vo.FestaVO;
import com.bar.beer.vo.BeerVO;

public class AdminDaoImplForOracle extends SqlSessionDaoSupport implements AdminDAO{

	@Override
	public int insertBeerDesc(BeerVO beerVO) {
		return getSqlSession().insert("AdminDAO.insertBeerDesc", beerVO);
	}

	@Override
	public int insertFesta(FestaVO festaVO) {
		return getSqlSession().insert("AdminDAO.insertFesta", festaVO);
	}


}
