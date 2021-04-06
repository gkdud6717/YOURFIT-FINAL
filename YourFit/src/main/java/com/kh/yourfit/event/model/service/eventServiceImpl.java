package com.kh.yourfit.event.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.common.exception.EventException;
import com.kh.yourfit.event.model.dao.eventDAO;
import com.kh.yourfit.event.model.vo.event;

@Service
public class eventServiceImpl implements eventService {
	
	@Autowired
	eventDAO eventDAO;

	@Override
	public List<Map<String, String>> selectEventList(int cPage, int numPerPage) {
		return eventDAO.selectEventList(cPage, numPerPage);
	}

	@Override
	public int selectTotalContentsEvent() {
		return eventDAO.selectTotalContentsEvent();
	}

	@Override
	public event selctEventOne(int e_No) {
		
		event event = eventDAO.selectEventOne(e_No);
		if( event != null) eventDAO.updateEventCount(e_No);
		
		return event;
	}
	
	@Override
	public List<board_file> selectEventFileList(int e_No) {
		return eventDAO.selectEventFileList(e_No);
	}

	@Override
	public List<Map<String, String>> eventSearch(int cPage, int numPerPage, String keyword, String searchType) {
		return eventDAO.eventSearch(cPage, numPerPage, keyword, searchType);
	}

	@Override
	public int selectTotalSearchEvent(String keyword) {
		return eventDAO.selectTotalSearchEvent(keyword);
	}
	
	@Override
	public int insertEvent(event event, List<board_file> fileList) {
		int result1 = eventDAO.insertEvent(event);
		
		if( result1 == 0 ) throw new EventException("게시글 등록오류");
		
		if(fileList.size() > 0) {
			for(board_file bf : fileList) {
				int result2 = eventDAO.insertEventFile(bf);
				if( result2 == 0 ) throw new EventException("첨부파일 등록오류");
			}
		}
		
		return result1;
	}

	@Override
	public int updateEvent(event event, List<board_file> board_file) {
		int totalResult = 0;
		
		// 원본 받아오기
		List<board_file> originList = eventDAO.selectEventFileList(event.getE_No());
		totalResult = eventDAO.updateEvent(event);
		
		if(totalResult == 0) throw new EventException("이벤트 수정 실패!");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if(originList.size() > 0) {
			totalResult = eventDAO.deleteAttachment(event.getE_No());
			
			if(totalResult == 0) throw new EventException("이벤트 첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if(board_file.size() >0) {
			for(board_file bf : board_file) {
				  // update라고 쓰지만, SQL은 insert로
				totalResult = eventDAO.updateAttachment(bf); 
				
				if(totalResult ==0 ) throw new EventException("첨부파일 추가 실패");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteEvent(int e_No) {
		return eventDAO.deleteEvent(e_No);
	}

}
