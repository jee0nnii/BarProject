package com.bar.user.dao;

import java.util.List;

import com.bar.beer.vo.BeerVO;
import com.bar.user.vo.UserVO;

public interface UserDAO {
	//로그인 한 사람 정보 가져오기
	public UserVO selectUser(UserVO userVO);
	//회원가입
	public int insertUser(UserVO userVO);
	//0418 회원가입시 선호하는 거 입력받아오기
	public int insertUserFavTaste(int favTasteId, int id);
	public int insertUserFavType(int favTypeId, int id);
	
	//선호 맛 선호타입 뽑아서 보여주기
	public UserVO selectUserFavTaste(int id);
	public UserVO selectUserFavType(int id);
	
	
	//암호화
	public String selectSalt(String email);
	//중복 이메일 닉네임 처리
	public int selectDuplicateEmail(String email);
	public int selectDuplicateNickname(String nickname);
	
	public List<BeerVO> selectFromTaste(int beerTasteId);
	public List<BeerVO> selectFromType(int beerTypeId);
	
}
