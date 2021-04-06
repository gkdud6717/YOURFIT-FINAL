package com.kh.yourfit.notice.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.notice.model.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("noticeMapper.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		int num = sqlSession.selectOne("noticeMapper.selectNoticeTotalContents");
	
	   return num;
	}

	@Override
	public Notice selectOneNotice(int n_no) {
		
		return sqlSession.selectOne("noticeMapper.selectOneNotice", n_no);
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	@Override
	public Notice noticeUpdateView(int n_no) {
		
		return sqlSession.selectOne("noticeMapper.noticeUpdateView", n_no);
	}

	@Override
	public int noticeUpdate(Notice notice) {
		
		return sqlSession.update("noticeMapper.noticeUpdate", notice);
	}

	@Override
	public List<Map<String, String>> noticeSearch(int cPage, int numPerPage, String keyword, String searchType) {
		
       RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		System.out.println("map" + map);
		
		return sqlSession.selectList("noticeMapper.noticeSearch", map, rows);
	}

	@Override
	public int noticeSearchCount(String keyword) {
		
		return sqlSession.selectOne("noticeMapper.noticeSearchCount", keyword);
	}

	@Override
	public int updateReadCount(int n_no) {
		
		return sqlSession.update("noticeMapper.updateReadCount", n_no);
	}

}
