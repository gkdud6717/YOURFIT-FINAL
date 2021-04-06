package com.kh.yourfit.cbBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.cbBoard.model.vo.cbBoard;

@Repository
public class cbBoardDAOImpl implements cbBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectcbBoard(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("cbBoard.selectcbBoard", null, rows);
	}
	
	@Override
	public int selectcbBoardTotalContents() {
		return sqlSession.selectOne("cbBoard.selectcbBoardTotalContents");
	}
	
	@Override
	public cbBoard selectOnecbBoard(String cb_no) {
		
		return sqlSession.selectOne("cbBoard.selectOnecbBoard", cb_no);
	}

	@Override
	public int deletecbBoard(String cb_no) {
		
		return sqlSession.delete("cbBoard.deletecbBoard", cb_no);
	}

	@Override
	public List<Map<String, String>> cbBoardSearch(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("cbBoard.cbBoardSearch", keyword, rows);
	}

	@Override
	public int cbBoardSearchCnt(String keyword) {

		return sqlSession.selectOne("cbBoard.cbBoardSearchCnt", keyword);
	}

	@Override
	public int updatechBoardCnt(String cb_no) {
		
		return sqlSession.update("cbBoard.updatechBoardCnt", cb_no);
	}

}
