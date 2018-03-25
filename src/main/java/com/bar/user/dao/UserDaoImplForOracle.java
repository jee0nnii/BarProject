package com.bar.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.user.vo.UserVO;

public class UserDaoImplForOracle extends SqlSessionDaoSupport implements UserDAO {

	@Override
	public int insertUser(UserVO userVO) {
		return getSqlSession().insert("UserDAO.insertUser", userVO);
	}

	
}
