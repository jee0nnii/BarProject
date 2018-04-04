package com.bar.beer.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.beer.vo.BeerVO;

public class BeerDaoImplForOracle extends SqlSessionDaoSupport implements BeerDAO{

	@Override
	public List<BeerVO> selectAll() {
		return getSqlSession().selectList("BeerDAO.selectAll");		
	}

	
}
