package com.kh.yourfit.cbBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.yourfit.cbBoard.model.dao.cbBoardDAO;
import com.kh.yourfit.cbBoard.model.vo.cbBoard;

@Service
public class cbBoardServiceImpl implements cbBoardService {
	
	@Autowired
	cbBoardDAO cbBoardDAO;
	
	@Override
	public List<Map<String, String>> selectcbBoard(int cPage, int numPerPage) {
	
		return cbBoardDAO.selectcbBoard(cPage, numPerPage);
	}
	
	@Override
	public int selectcbBoardTotalContents() {

		return cbBoardDAO.selectcbBoardTotalContents();
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public cbBoard selectOnecbBoard(String cb_no) {
		cbBoardDAO.updatechBoardCnt(cb_no);
		
		return cbBoardDAO.selectOnecbBoard(cb_no);
	}

	@Override
	public int deletecbBoard(String cb_no) {
		
		return cbBoardDAO.deletecbBoard(cb_no);
	}

	@Override
	public List<Map<String, String>> cbBoardSearch(int cPage, int numPerPage, String keyword) {

		return cbBoardDAO.cbBoardSearch(cPage, numPerPage, keyword);
	}

	@Override
	public int cbBoardSearchCnt(String keyword) {
		
		return cbBoardDAO.cbBoardSearchCnt(keyword);
	}


}
