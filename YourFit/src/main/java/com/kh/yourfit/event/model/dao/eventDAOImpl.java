package com.kh.yourfit.event.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.event.model.vo.event;

@Repository
public class eventDAOImpl implements eventDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectEventList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("eventMapper.selectEventList", null, rows);
	}
	
	@Override
	public int selectTotalContentsEvent() {
		return sqlSession.selectOne("eventMapper.selectTotalContentsEvent");
	}

	@Override
	public event selectEventOne(int e_No) {
		return sqlSession.selectOne("eventMapper.selectEventOne", e_No);
	}
	
	@Override
	public int updateEventCount(int e_No) {
		return sqlSession.update("eventMapper.updateEventCount", e_No);
	}

	@Override
	public List<board_file> selectEventFileList(int e_No) {
		return sqlSession.selectList("eventMapper.selectEventFileList", e_No);
	}

	@Override
	public List<Map<String, String>> eventSearch(int cPage, int numPerPage, String keyword, String searchType) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		return sqlSession.selectList("eventMapper.eventSearch", map, rows);
	}

	@Override
	public int selectTotalSearchEvent(String keyword) {
		return sqlSession.update("eventMapper.selectTotalSearchEvent", keyword);
	}
	
	@Override
	public int insertEvent(event event) {
		return sqlSession.insert("eventMapper.insertEvent", event);
	}

	@Override
	public int insertEventFile(board_file bf) {
		return sqlSession.insert("eventMapper.insertEventFile", bf);
	}

	@Override
	public int updateEvent(event event) {
		return sqlSession.update("eventMapper.updateEvent", event);
	}

	@Override
	public int deleteAttachment(int e_No) {
		return sqlSession.delete("eventMapper.deleteAttachment", e_No);
	}

	@Override
	public int updateAttachment(board_file bf) {
		return sqlSession.insert("eventMapper.updateAttachment", bf);
	}

	@Override
	public int deleteEvent(int e_No) {
		return sqlSession.update("eventMapper.deleteEvent", e_No);
	}

}
