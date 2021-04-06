package com.kh.yourfit.adBoard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;

import com.kh.yourfit.dtboard.model.vo.DtBoard;



public interface AdBoardService {

	int insertBoard(AdBoard adboard, List<board_file> fileList);

	AdBoard selectOneBoard(String ad_No);

	List<board_file> selectBoardFileList(String ad_No);

	AdBoard updateView(String ad_No);

	int updateBoard(AdBoard adboard, List<board_file> boardfileList);

	int deleteBoard(String ad_No);
	
}