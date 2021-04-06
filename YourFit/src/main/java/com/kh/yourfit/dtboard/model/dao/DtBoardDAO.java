package com.kh.yourfit.dtboard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

public interface DtBoardDAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();
	
	int insertBoard(DtBoard dtboard);

	int insertBoardFile(board_file bf);
	
	DtBoard selectOneBoard(String dt_No);
	
	List<board_file> selectBoardFileList(String dt_No);

	int updateReadCount(String dt_No);
	
	int updateBoard(DtBoard dtboard);
	
	int updateBoardFile(board_file bf);

	int deleteBoardFile(String dt_No);

	int deleteBoard(String dt_No);

	int deleteFile(int fNo);

	int insertboardComment(board_comment board_comment);

	List<board_comment> selectBoardComment(String dt_No);

	List<Map<String, String>> selectBoardListCal(int cPage, int numPerPage);

	List<Map<String, String>> selectBoardListExe(int cPage, int numPerPage);

	List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage);

	int deleteBoardComment(int bc_no);

	int updateBaordComment(board_comment board_comment);

	List<Map<String, String>> dtBoardSearch(int cPage, int numPerPage, String keyword, String searchType);

	int dtBoardSerchCount(String keyword);

	

	



	

	
}
