package com.kh.yourfit.ht_board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.ht_board.model.dao.ht_boardDAO;
import com.kh.yourfit.ht_board.model.vo.ht_board;

@Service
public class ht_boardServiceImpl implements ht_boardService {

	
	@Autowired
	ht_boardDAO ht_boardDAO;
	
	@Override
	public List<Map<String, String>> selecthtBoardList(int cPage, int numPerPage) {
		return ht_boardDAO.selecthtBoardList(cPage, numPerPage);
	}
	

	@Override
	public int selecthtBoardTotalContents() {
		return ht_boardDAO.selectBoardTotalContents();
	}


	@Override
	public ht_board selectOneBoard(String ht_No) {
		ht_board ht_board = ht_boardDAO.selectOneBoard(ht_No);
		
		// 조회수 1 증가!
		if(ht_board != null) ht_boardDAO.updateReadCount(ht_No);
		return ht_board;
	}


	@Override
	public int insertboardComment(board_comment board_comment) {
		return ht_boardDAO.insertboardComment(board_comment);
	}


	@Override
	public List<board_comment> selectBoardComment(String ht_No) {
		return ht_boardDAO.selectBoardComment(ht_No);
	}


	@Override
	public int updateBoardComment(board_comment board_comment) {
		return ht_boardDAO.updateBoardComment(board_comment);
	}


	@Override
	public int deleteBoardComment(int bc_no) {
		return ht_boardDAO.deleteBoardComment(bc_no);
	}


	@Override
	public int inserthtBoard(ht_board ht_board) {
		return ht_boardDAO.inserthtBoard(ht_board);
	}


	@Override
	public int boardUpdate(ht_board ht_board) {
		return ht_boardDAO.boardUpdate(ht_board);
	}


	@Override
	public int boardDelete(String ht_No) {
		return ht_boardDAO.boardDelete(ht_No);
	}


	@Override
	public List<Map<String, String>> htboardSearch(int cPage, int numPerPage, String keyword, String searchType) {
		return ht_boardDAO.htboardSearch(cPage, numPerPage, keyword, searchType);
	}


	@Override
	public int htboardSearchCount(String keyword) {
		return ht_boardDAO.htboardSearchCount(keyword);
	}


	@Override
	public List<Map<String, String>> selecthtBoardListBody(int cPage, int numPerPage) {
		return ht_boardDAO.selecthtBoardListBody(cPage, numPerPage);
	}


	@Override
	public int selecthtBoardTotalContentsBody() {
		return ht_boardDAO.selecthtBoardTotalContentsBody();
	}


	@Override
	public List<Map<String, String>> selecthtBoardListUp(int cPage, int numPerPage) {
		return ht_boardDAO.selecthtBoardListUp(cPage, numPerPage);
	}


	@Override
	public int selecthtBoardTotalContentsUp() {
		return ht_boardDAO.selecthtBoardTotalContentsUp();
	}


	@Override
	public List<Map<String, String>> selecthtBoardListLow(int cPage, int numPerPage) {
		return ht_boardDAO.selecthtBoardListLow(cPage, numPerPage);
	}


	@Override
	public int selecthtBoardTotalContentsLow() {
		return ht_boardDAO.selecthtBoardTotalContentsLow();
	}


	@Override
	public List<Map<String, String>> selecthtBoardListMid(int cPage, int numPerPage) {
		return ht_boardDAO.selecthtBoardListMid(cPage, numPerPage);
	}


	@Override
	public int selecthtBoardTotalContentsMid() {
		return ht_boardDAO.selecthtBoardTotalContentsMid();
	}


	@Override
	public List<Map<String, String>> selecthtBoardListStret(int cPage, int numPerPage) {
		return ht_boardDAO.selecthtBoardListStret(cPage, numPerPage);
	}


	@Override
	public int selecthtBoardTotalContentsStret() {
		return ht_boardDAO.selecthtBoardTotalContentsStret();
	}






}
