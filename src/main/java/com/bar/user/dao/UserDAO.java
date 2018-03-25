package com.bar.user.dao;

import com.bar.user.vo.UserVO;

public interface UserDAO {
	//로그인 한 사람 정보 가져오기
	public UserVO selectUser(UserVO userVO);
	//회원가입
	public int insertUser(UserVO userVO);
	//암호화
	public String selectSalt(String email);
	//중복 이메일 닉네임 처리
	public int selectDuplicateEmail(String email);
	public int selectDuplicateNickname(String nickname);
}
