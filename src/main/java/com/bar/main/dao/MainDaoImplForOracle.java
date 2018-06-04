package com.bar.main.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.admin.vo.FestaVO;

public class MainDaoImplForOracle extends SqlSessionDaoSupport implements MainDAO{


	@Override
	public List<FestaVO> selectFestaAll() {
		return getSqlSession().selectList("MainDAO.selectFestaAll");
	}

	@Override
	public FestaVO selectFestaOne(int festaId) {
		return getSqlSession().selectOne("MainDAO.selectFestaOne",festaId);
	}
}
