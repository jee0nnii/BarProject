package com.bar.admin.service;

import com.bar.admin.dao.AdminDAO;
import com.bar.admin.vo.FestaVO;
import com.bar.beer.vo.BeerVO;

public class AdminServiceImpl implements AdminService{

	private AdminDAO adminDao;
	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}
	@Override
	public boolean createBeerDesc(BeerVO beerVO) {
		return adminDao.insertBeerDesc(beerVO)>0;
	}
	@Override
	public boolean createFesta(FestaVO festaVO) {
		return adminDao.insertFesta(festaVO)>0;
	}

}
