package com.bar.talk.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bar.talk.vo.QnaVO;

public class QnaDaoImplForOracle extends SqlSessionDaoSupport implements QnaDAO{

	@Override
	public List<QnaVO> selectAll() {
		return getSqlSession().selectList("QnaDAO.selectAll");
	}

	@Override
	public QnaVO selectOne(int qnaId) {
		return getSqlSession().selectOne("QnaDAO.selectOne",qnaId);
	}

	@Override
	public int insertQna(QnaVO qnaVO) {
		return getSqlSession().insert("QnaDAO.insertQna", qnaVO);
	}

	@Override
	public int deleteQna(int qnaId) {
		return getSqlSession().delete("QnaDAO.deleteQna",qnaId);
	}

	@Override
	public int updateQna(QnaVO qnaVO) {
		return getSqlSession().update("QnaDAO.updateQna",qnaVO);
	}

}
