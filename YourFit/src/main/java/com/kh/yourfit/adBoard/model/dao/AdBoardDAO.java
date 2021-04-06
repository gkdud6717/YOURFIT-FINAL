package com.kh.yourfit.adBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

public interface AdBoardDAO {

	int insertBoard(AdBoard adboard);

	int insertBoardFile(board_file bf);

	AdBoard selectOneBoard(String ad_No);

	int updateReadCount(String ad_No);

	List<board_file> selectBoardFileList(String ad_No);

	int deleteBoardFile(String ad_No);

	int updateBoardFile(board_file bf);

	int updateBoard(AdBoard adboard);

	int deleteBoard(String ad_No);
	
}
