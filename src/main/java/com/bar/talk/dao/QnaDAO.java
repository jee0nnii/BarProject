package com.bar.talk.dao;

import java.util.List;

import com.bar.talk.vo.QnaVO;

public interface QnaDAO {

	public List<QnaVO> selectAll();
	public QnaVO selectOne(int qnaId);
	//작성
	public int insertQna(QnaVO qnaVO);

	public int deleteQna(int qnaId);
	public int updateQna(QnaVO qnaVO);
}
