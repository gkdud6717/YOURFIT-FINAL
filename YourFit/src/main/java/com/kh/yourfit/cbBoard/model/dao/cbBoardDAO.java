package com.kh.yourfit.cbBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.cbBoard.model.vo.cbBoard;

public interface cbBoardDAO {

	List<Map<String, String>> selectcbBoard(int cPage, int numPerPage);
	
	int selectcbBoardTotalContents();

	cbBoard selectOnecbBoard(String cb_no);

	int deletecbBoard(String cb_no);

	List<Map<String, String>> cbBoardSearch(int cPage, int numPerPage, String keyword);

	int cbBoardSearchCnt(String keyword);
	
	int updatechBoardCnt(String cb_no);

}
