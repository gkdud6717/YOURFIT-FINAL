package com.kh.yourfit.ht_board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.ht_board.model.vo.ht_board;

public interface ht_boardDAO {

	List<Map<String, String>> selecthtBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	ht_board selectOneBoard(String ht_No);

	int updateReadCount(String ht_No);

	int insertboardComment(board_comment board_comment);

	List<board_comment> selectBoardComment(String ht_No);

	int updateBoardComment(board_comment board_comment);

	int deleteBoardComment(int bc_no);

	int inserthtBoard(ht_board ht_board);

	int boardUpdate(ht_board ht_board);

	int boardDelete(String ht_No);

	List<Map<String, String>> htboardSearch(int cPage, int numPerPage, String keyword, String searchType);

	int htboardSearchCount(String keyword);

	List<Map<String, String>> selecthtBoardListBody(int cPage, int numPerPage);

	int selecthtBoardTotalContentsBody();

	List<Map<String, String>> selecthtBoardListUp(int cPage, int numPerPage);

	int selecthtBoardTotalContentsUp();

	List<Map<String, String>> selecthtBoardListLow(int cPage, int numPerPage);

	int selecthtBoardTotalContentsLow();

	List<Map<String, String>> selecthtBoardListMid(int cPage, int numPerPage);

	int selecthtBoardTotalContentsMid();

	List<Map<String, String>> selecthtBoardListStret(int cPage, int numPerPage);

	int selecthtBoardTotalContentsStret();

}
