package com.bar.admin.service;

import com.bar.admin.vo.FestaVO;
import com.bar.beer.vo.BeerVO;

public interface AdminService {

	public boolean createBeerDesc(BeerVO beerVO);

	public boolean createFesta(FestaVO festaVO);
}
