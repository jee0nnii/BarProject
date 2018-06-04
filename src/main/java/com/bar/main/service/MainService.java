package com.bar.main.service;

import java.util.List;

import com.bar.admin.vo.FestaVO;

public interface MainService {

	public List<FestaVO> getAllFestas();
	public FestaVO getOneFesta(int festaId);
}
