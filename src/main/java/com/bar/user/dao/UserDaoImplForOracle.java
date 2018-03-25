package com.bar.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.user.vo.UserVO;

public class UserDaoImplForOracle extends SqlSessionDaoSupport implements UserDAO {

	//회원가입
	@Override
	public int insertUser(UserVO userVO) {
		return getSqlSession().insert("UserDAO.insertUser", userVO);
	}
	//로그인
	@Override
	public UserVO selectUser(UserVO userVO) {
		return getSqlSession().selectOne("UserDAO.selectUser", userVO);
	}
	//암호화
	@Override
	public String selectSalt(String email) {
		return getSqlSession().selectOne("UserDAO.selectSalt", email);
	}
	//이메일 중복확인
	@Override
	public int selectDuplicateEmail(String email) {
		return getSqlSession().selectOne("UserDAO.selectDuplicateEmail", email);
	}
	//닉네임 중복확인
	@Override
	public int selectDuplicateNickname(String nickname) {
		return getSqlSession().selectOne("UserDAO.selectDuplicateNickname", nickname);
	}

	
}
