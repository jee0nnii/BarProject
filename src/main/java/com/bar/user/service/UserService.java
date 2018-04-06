package com.bar.user.service;

import com.bar.user.vo.UserVO;

public interface UserService {
	public boolean createUser(UserVO userVO);
	public UserVO readUser(UserVO userVO); 
	
	//user 비밀번호 찾기
	public boolean findUserPwd(UserVO userVO);
	
	public boolean readDuplicateEmail(String email);
	public boolean readDuplicateNickname(String nickname);
	
}
