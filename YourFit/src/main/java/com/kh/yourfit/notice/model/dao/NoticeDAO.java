package com.kh.yourfit.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.notice.model.vo.Notice;

public interface NoticeDAO {
	
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();
	
	Notice selectOneNotice(int n_no);

	int insertNotice(Notice notice);

	Notice noticeUpdateView(int n_no);

	int noticeUpdate(Notice notice);

	List<Map<String, String>> noticeSearch(int cPage, int numPerPage, String keyword, String searchType);

	int noticeSearchCount(String keyword);

	int updateReadCount(int n_no);

}
