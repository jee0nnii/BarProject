package com.bar.admin.dao;

import com.bar.admin.vo.FestaVO;
import com.bar.beer.vo.BeerVO;

public interface AdminDAO {
	public int insertBeerDesc(BeerVO beerVO);
	public int insertFesta(FestaVO festaVO);
	
}
