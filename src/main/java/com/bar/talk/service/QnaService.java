package com.bar.talk.service;

import java.util.List;

import com.bar.talk.vo.QnaVO;

public interface QnaService {
	public List<QnaVO> getAll();
	public QnaVO getOne(int qnaId);
	public boolean createQna(QnaVO qnaVO);
	
	public boolean deleteQna(int qnaId);
	public boolean updateQna(QnaVO qnaVO);
}
