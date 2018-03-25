package com.bar.user.dao;

import com.bar.user.vo.UserVO;

public interface UserDAO {
	//회원가입
	public int insertUser(UserVO userVO);
	//멤버선택
	//public UserVO selectUser(UserVO userVO);
	
}
