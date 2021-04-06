package com.kh.yourfit.dtboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;

import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Repository
public class DtBoardDAOImpl implements DtBoardDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("dtBoardMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return sqlSession.selectOne("dtBoardMapper.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(DtBoard dtboard) {
		
		return sqlSession.insert("dtBoardMapper.insertBoard", dtboard);
	}

	@Override
	public int insertBoardFile(board_file bf) {
		
		return sqlSession.insert("dtBoardMapper.insertBoardFile", bf);
	}

	@Override
	public DtBoard selectOneBoard(String dt_No) {
		
		return sqlSession.selectOne("dtBoardMapper.selectOneBoard", dt_No);
	}

	@Override
	public List<board_file> selectBoardFileList(String dt_No) {
		
		return sqlSession.selectList("dtBoardMapper.selectBoardFileList", dt_No);
	}

	@Override
	public int updateReadCount(String dt_No) {
		
		return sqlSession.update("dtBoardMapper.updateReadCount", dt_No);
	}

	@Override
	public int updateBoard(DtBoard dtboard) {
			
		return sqlSession.update("dtBoardMapper.updateBoard", dtboard);
	}

	@Override
	public int updateBoardFile(board_file bf) {
		
		return sqlSession.insert("dtBoardMapper.updateBoardFile", bf);
	}

	@Override
	public int deleteBoardFile(String dt_No) {
		
		return sqlSession.delete("dtBoardMapper.deleteBoardFile", dt_No);
	}

	@Override
	public int deleteBoard(String dt_No) {
		
		return sqlSession.delete("dtBoardMapper.deleteBoard", dt_No);
	}

	@Override
	public int deleteFile(int fNo) {
		
		return sqlSession.delete("dtBoardMapper.deleteFile", fNo);
	}

	@Override
	public int insertboardComment(board_comment board_comment) {
		
		return sqlSession.insert("dtBoardMapper.insertboardComment", board_comment);
	}

	@Override
	public List<board_comment> selectBoardComment(String dt_No) {
		
		return sqlSession.selectList("dtBoardMapper.selectBoardComment", dt_No);
	}

	
	@Override
	public List<Map<String, String>> selectBoardListCal(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("dtBoardMapper.selectBoardListCal", null, rows);
	}

	@Override
	public List<Map<String, String>> selectBoardListExe(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("dtBoardMapper.selectBoardListExe", null, rows);
	}

	@Override
	public List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage) {
RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("dtBoardMapper.selectBoardListDiet", null, rows);
	}

	@Override
	public int deleteBoardComment(int bc_no) {
		
		return sqlSession.delete("dtBoardMapper.deleteBoardComment", bc_no);
	}

	@Override
	public int updateBaordComment(board_comment board_comment) {
	
		return sqlSession.update("dtBoardMapper.updateBoardComment", board_comment);
	}

	@Override
	public List<Map<String, String>> dtBoardSearch(int cPage, int numPerPage, String keyword, String searchType) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		System.out.println("map" + map);
		
		return sqlSession.selectList("dtBoardMapper.dtBoardSearch", map, rows);
	}

	@Override
	public int dtBoardSerchCount(String keyword) {
		
		return sqlSession.update("dtBoardMapper.dtBoardSearchCount", keyword);
	}




}
