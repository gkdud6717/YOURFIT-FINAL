package com.kh.yourfit.co_board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.co_board.model.vo.co_board;



public interface co_boardDAO {
	List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertcoBoard(co_board co_board);

	int insertAttachment(board_file a);

	co_board selectOneBoard(String co_No);

	public List<board_file> selectfileList(String co_No);

	int updateReadCount(String co_No);
	
	int updateBoard(co_board co_board);

	int updateAttachment(board_file board_file);

	int deleteBoard(String co_No);

	// 만약 DataBase에서 ATTACHMENT 테이블에 
	// ON DELETE CASCADE 옵션이 선언되지 않았다면
	// 이 메소드로 첨부파일 삭제도 구현해야 한다.
	int deleteAttachment(String co_No);
	
	int deleteFile(int f_No);

	List<Map<String, String>> selectcoBoardListFood(int cPage, int numPerPage);


	int insertboardComment(board_comment board_comment);

	List<board_comment> selectBoardComment(String co_No);

	int deleteBoardComment(int bc_no);

	int updateBoardComment(board_comment board_comment);

	List<Map<String, String>> coboardSearch(int cPage, int numPerPage, String keyword, String searchType);

	int coboardSearchCount(String keyword);

	List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage);

	int selectcoBoardTotalContentsDiet();

	List<Map<String, String>> selectBoardListExer(int cPage, int numPerPage);

	int selectcoBoardTotalContentsExer();

	List<Map<String, String>> selectBoardListQA(int cPage, int numPerPage);

	int selectcoBoardTotalContentsQA();

	List<Map<String, String>> selectBoardListTip(int cPage, int numPerPage);

	int selectcoBoardTotalContentTip();

	List<Map<String, String>> selectBoardListToAdmin(int cPage, int numPerPage);

	int selectcoBoardTotalContentsToAdmin();




}
