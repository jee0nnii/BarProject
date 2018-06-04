package com.bar.talk.service;

import java.util.List;

import com.bar.talk.dao.QnaDAO;
import com.bar.talk.vo.QnaVO;

public class QnaServiceImpl implements QnaService{

	private QnaDAO qnaDao;
	public void setQnaDao(QnaDAO qnaDao) {
		this.qnaDao = qnaDao;
	}
	@Override
	public List<QnaVO> getAll() {
		return qnaDao.selectAll();
	}
	@Override
	public QnaVO getOne(int qnaId) {
		return qnaDao.selectOne(qnaId);
	}
	@Override
	public boolean createQna(QnaVO qnaVO) {
		return qnaDao.insertQna(qnaVO)>0;
	}
	@Override
	public boolean deleteQna(int qnaId) {
		return qnaDao.deleteQna(qnaId)>0;
	}
	@Override
	public boolean updateQna(QnaVO qnaVO) {
		return qnaDao.updateQna(qnaVO)>0;
	}
	
}
