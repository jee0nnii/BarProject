package com.bar.user.service;

import com.bar.user.vo.UserVO;

public interface UserService {
	public boolean createUser(UserVO userVO);
	public UserVO readUser(UserVO userVO); 
	public boolean readDuplicateEmail(String email);
	public boolean readDuplicateNickname(String nickname);
	
}
