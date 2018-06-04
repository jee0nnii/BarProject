package com.bar.user.service;

import java.util.List;

import com.bar.beer.dao.BeerDAO;
import com.bar.beer.vo.BeerVO;
import com.bar.user.dao.UserDAO;
import com.bar.user.vo.UserVO;
import com.bar.util.SHA256Util;

public class UserServiceImpl implements UserService {

	private UserDAO userDao;
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao; 
	}

	@Override
	public boolean createUser(UserVO userVO) {
		// 회원가입을 진행하면서 비밀번호를 암호화 시킬꺼임
		String salt = SHA256Util.generateSalt();
		userVO.setSalt(salt);
		// 입력한 비밀번호
		String password = userVO.getPassword();
		// 암호화시켜서 재할당
		password = SHA256Util.getEncrypt(password, salt);
		// 암호화된 비밀번호 부여
		userVO.setPassword(password);
		if(!(userDao.insertUser(userVO) > 0)) {
			return false;
		}	
		for(int i=0; i< userVO.getUserFavTasteVO().getBeerTasteIdList().size(); i++) {
			if(!(userDao.insertUserFavTaste(userVO.getUserFavTasteVO().getBeerTasteIdList().get(i), userVO.getId()) >0)) {
				return false;
			}
		}	
		for(int j=0; j< userVO.getUserFavTypeVO().getBeerTypeIdList().size(); j++) {
			if(!(userDao.insertUserFavType(userVO.getUserFavTypeVO().getBeerTypeIdList().get(j), userVO.getId()) >0)) {
				return false;
			}
		}	
		return true;
	}

	@Override
	public UserVO readUser(UserVO userVO) {
		// 사용자의 email로 salt된 값을 가져옮
		String salt = userDao.selectSalt(userVO.getEmail());
		if (salt == null) {
			salt = "";
		}
		// salt로 암호화
		String password = userVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		userVO.setPassword(password);
		return userDao.selectUser(userVO);

	}
	@Override
	public UserVO readUserFavTaste(int id) {
		return userDao.selectUserFavTaste(id);
	}

	@Override
	public UserVO readUserFavType(int id) {
		return userDao.selectUserFavType(id);
	}


	@Override
	public boolean findUserPwd(UserVO userVO) {
		return false;
	}
	@Override
	public boolean readDuplicateEmail(String email) {
		return userDao.selectDuplicateEmail(email) > 0;
	}

	@Override
	public boolean readDuplicateNickname(String nickname) {
		return userDao.selectDuplicateNickname(nickname) > 0;
	}


	@Override
	public List<BeerVO> getTaste(int beerTasteId) {
		return userDao.selectFromTaste(beerTasteId);
	}

	@Override
	public List<BeerVO> getType(int beerTypeId) {
		return userDao.selectFromType(beerTypeId);
	}

}
