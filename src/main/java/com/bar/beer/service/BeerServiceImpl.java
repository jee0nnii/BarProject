package com.bar.beer.service;

import java.util.List;

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
		pageExplorer.setList(beerDao.selectAll(beerPageVO));
		return pageExplorer;
	}

	@Override
	public BeerVO getOne(int beerId) {
		return beerDao.selectOne(beerId);
	}
	//좋아요 수 확인
	@Override
	public boolean chooseLikeBeer(int beerId) {
		int likePoint = beerDao.incrementBeerLike(beerId);
		return likePoint > 0;
	}

	@Override
	public List<BeerVO> getTaste(int beerTasteId) {
		return beerDao.selectFromTaste(beerTasteId);
	}

	@Override
	public List<BeerVO> getType(int beerTypeId) {
		return beerDao.selectFromType(beerTypeId);
	}

}
