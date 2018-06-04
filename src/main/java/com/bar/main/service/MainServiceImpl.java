package com.bar.main.service;

import java.util.List;

import com.bar.admin.vo.FestaVO;
import com.bar.main.dao.MainDAO;

public class MainServiceImpl implements MainService{

	private MainDAO mainDao;
	public void setMainDao(MainDAO mainDao) {
		this.mainDao = mainDao;
	}
	@Override
	public List<FestaVO> getAllFestas() {
		return mainDao.selectFestaAll();
	}
	@Override
	public FestaVO getOneFesta(int festaId) {
		return mainDao.selectFestaOne(festaId);
	}
	
}
