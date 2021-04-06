package com.kh.yourfit.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.notice.model.dao.NoticeDAO;
import com.kh.yourfit.notice.model.vo.Notice;

@Service 
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return noticeDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return noticeDAO.selectNoticeTotalContents();
	}

	@Override
	public Notice selectOneNotice(int n_no) {
	   
		Notice notice = noticeDAO.selectOneNotice(n_no);
		
		if(notice != null) noticeDAO.updateReadCount(n_no);
		
		return notice;
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return noticeDAO.insertNotice(notice);
	}

	@Override
	public Notice noticeUpdateView(int n_no) {
		
		return noticeDAO.noticeUpdateView(n_no);
	}

	@Override
	public int noticeUpdate(Notice notice) {
		
		return noticeDAO.noticeUpdate(notice);
	}

	@Override
	public List<Map<String, String>> noticeSearch(int cPage, int numPerPage, String keyword, String searchType) {
		
		return noticeDAO.noticeSearch(cPage, numPerPage, keyword, searchType);
	}

	@Override
	public int noticeSearchCount(String keyword) {
		
		return noticeDAO.noticeSearchCount(keyword);
	}

}
