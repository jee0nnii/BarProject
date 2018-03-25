package com.bar.user.service;

import com.bar.user.dao.UserDAO;
import com.bar.user.vo.UserVO;

public class UserServiceImpl implements UserService{

	private UserDAO userDao;
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	@Override
	public boolean createUser(UserVO userVO) {
		return userDao.insertUser(userVO)>0;
	}

}
