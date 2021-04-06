package com.kh.yourfit.event.model.service;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.event.model.vo.event;

public interface eventService {
	
	List<Map<String, String>> selectEventList(int cPage, int numPerPage);
	int selectTotalContentsEvent();

	event selctEventOne(int e_No);

	List<board_file> selectEventFileList(int e_No);
	
	List<Map<String, String>> eventSearch(int cPage, int numPerPage, String keyword, String searchType);
	
	int selectTotalSearchEvent(String keyword);
	
	int insertEvent(event event, List<board_file> fileList);
	
	int updateEvent(event event, List<board_file> board_file);
	
	int deleteEvent(int e_No);

}
