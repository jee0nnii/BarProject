package com.bar.beer.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.beer.vo.BeerEvalVO;

public class BeerEvalDaoImplForOracle extends SqlSessionDaoSupport implements BeerEvalDAO{

	@Override
	public List<BeerEvalVO> selectAllEvals(int beerId) {
		return getSqlSession().selectList("BeerEvalDAO.selectAllEvals",beerId);
	}

	@Override
	public int insertEval(BeerEvalVO beerEvalVO) {/*
		int seq = getSqlSession().selectOne("BeerEvalDAO.nextValue");
		beerEvalVO.setBeerEvalId(seq);*/
		return getSqlSession().insert("BeerEvalDAO.insertEval", beerEvalVO);
	}

	@Override
	public BeerEvalVO selectOneEval(int beerEvalId) {
		return getSqlSession().selectOne("BeerEvalDAO.selectOneEval",beerEvalId);
	}

}
