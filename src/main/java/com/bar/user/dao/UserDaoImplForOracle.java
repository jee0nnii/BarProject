package com.bar.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.beer.vo.BeerVO;
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
	//0418 추가
	@Override
	public int insertUserFavTaste(int favTasteId, int userId) {
		Map<String, Integer> param = new HashMap<>();
		param.put("favTasteId", favTasteId);
		param.put("userId", userId);
		return getSqlSession().insert("UserDAO.insertUserFavTaste", param);
	}
	@Override
	public int insertUserFavType(int favTypeId, int id) {
		Map<String, Integer> param = new HashMap<>();
		param.put("favTypeId", favTypeId);
		param.put("userId", id);
		return getSqlSession().insert("UserDAO.insertUserFavType", param);
	}
	//몰라
	@Override
	public UserVO selectUserFavTaste(int id) {
		return getSqlSession().selectOne("UserDAO.selectUserFavTaste",id);
	}
	@Override
	public UserVO selectUserFavType(int id) {
		return getSqlSession().selectOne("UserDAO.selectUserFavType",id);
	}

	//강 다섯거ㅐ
	@Override
	public List<BeerVO> selectFromTaste(int beerTasteId) {
		return getSqlSession().selectList("BeerDAO.selectFromTaste", beerTasteId);
	}

	@Override
	public List<BeerVO> selectFromType(int beerTypeId) {
		return getSqlSession().selectList("BeerDAO.selectFromType", beerTypeId);
	}


	


	
}
