package com.bar.beer.service;

import com.bar.beer.dao.BeerDAO;
import com.bar.beer.vo.BeerPageVO;
import com.bar.beer.vo.BeerVO;

import web.pager.Pager;
import web.pager.PagerFactory;
import web.pager.explorer.ClassicPageExplorer;
import web.pager.explorer.PageExplorer;

public class BeerServiceImpl implements BeerService{
	
	private BeerDAO beerDao;
	
	public void setBeerDao(BeerDAO beerDao) {
		this.beerDao = beerDao;
	}
	
	/*@Override
	public List<BeerVO> getAll() {
		return beerDao.selectAll();
	}*/

	@Override
	public PageExplorer getAll(BeerPageVO beerPageVO) {
		Pager pager = PagerFactory.getPager(Pager.ORACLE, beerPageVO.getPageNo()+"",
				beerDao.selectCountAll(beerPageVO));
		PageExplorer pageExplorer = pager.makePageExplorer(ClassicPageExplorer.class, beerPageVO);
		pageExplorer.setList(beerDao.selecAll(beerPageVO));
		return pageExplorer;
	}

	@Override
	public BeerVO getOne(int beerId) {
		return beerDao.selectOne(beerId);
	}

}
