package com.bar.main.dao;

import java.util.List;

import com.bar.admin.vo.FestaVO;

public interface MainDAO {

	public List<FestaVO> selectFestaAll();
	public FestaVO selectFestaOne(int festaId);
}
