package com.kh.yourfit.event.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.event.model.vo.event;

public interface eventDAO {

	List<Map<String, String>> selectEventList(int cPage, int numPerPage);
	
	int selectTotalContentsEvent();

	event selectEventOne(int e_No);

	int updateEventCount(int e_No);

	List<board_file> selectEventFileList(int e_No);

	List<Map<String, String>> eventSearch(int cPage, int numPerPage, String keyword, String searchType);

	int selectTotalSearchEvent(String keyword);

	int insertEvent(event event);

	int insertEventFile(board_file bf);

	int updateEvent(event event);

	int deleteAttachment(int e_No);

	int updateAttachment(board_file bf);

	int deleteEvent(int e_No);

	


}
