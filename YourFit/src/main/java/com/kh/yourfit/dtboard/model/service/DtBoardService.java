package com.kh.yourfit.dtboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;

import com.kh.yourfit.dtboard.model.vo.DtBoard;



public interface DtBoardService {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();

	int insertBoard(DtBoard dtboard, List<board_file> fileList);

	DtBoard selectOneBoard(String dt_No);

	List<board_file> selectBoardFileList(String dt_No);

	DtBoard updateView(String dt_No);

	int updateBoard(DtBoard dtboard, List<board_file> boardfileList);

	int deleteBoard(String dt_No);

	int deleteFile(int fNo);

    int insertboardComment(board_comment board_comment);

	List<board_comment> selectBoardComment(String dt_No);

	List<Map<String, String>> selectBoardListCal(int cPage, int numPerPage);

	List<Map<String, String>> selectBoardListExe(int cPage, int numPerPage);

	List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage);

	int deleteBoardComment(int bc_no);

	int updateBoardComment(board_comment board_comment);

	

	int dtBoardSearchCount(String keyword);

	List<Map<String, String>> dtBoardSearch(int cPage, int numPerPage, String keyword, String searchType);

	

	
	

	

	
	
}
