package com.bar.user.service;

import java.util.List;

import com.bar.beer.vo.BeerVO;
import com.bar.user.vo.UserFavTasteVO;
import com.bar.user.vo.UserVO;

public interface UserService {
	public boolean createUser(UserVO userVO);
	//
	public UserVO readUser(UserVO userVO); 
	
	public UserVO readUserFavTaste(int id);
	public UserVO readUserFavType(int id);
	
	//user 비밀번호 찾기
	public boolean findUserPwd(UserVO userVO);
	
	public boolean readDuplicateEmail(String email);
	public boolean readDuplicateNickname(String nickname);

	public List<BeerVO> getTaste(int beerTypeId);
	public List<BeerVO> getType(int beerTypeId);
	
}
