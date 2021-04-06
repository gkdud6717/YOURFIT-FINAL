package com.kh.yourfit.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.notice.model.vo.Notice;

public interface NoticeService {

	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	Notice noticeUpdateView(int n_no);

	Notice selectOneNotice(int n_no);

	int insertNotice(Notice notice);

	int noticeUpdate(Notice notice);

	List<Map<String, String>> noticeSearch(int cPage, int numPerPage, String keyword, String searchType);

	int noticeSearchCount(String keyword);

}
