package com.kh.yourfit.ht_board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.ht_board.model.vo.ht_board;

@Repository
public class ht_boardDAOImpl implements ht_boardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selecthtBoardList(int cPage, int numPerPage) {
		 // RowBounds : 전체 게시글중 특정 게시글만 갖고 오게 하기
	      // 1페이지면 (0,10): 0번부터 10개 0~9게시글 , 2 페이지면 (1,10) : 10번부터 10개 10~19게시글
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
									// 줄건없지만 rows를 통해 자를것이다
		System.out.println(sqlSession.selectList("htboardMapper.selecthtBoardList", null, rows));
		return sqlSession.selectList("htboardMapper.selecthtBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		int num = sqlSession.selectOne("htboardMapper.selectBoardTotalContents");
	
		return num;
	}

	@Override
	public ht_board selectOneBoard(String ht_No) {
		return sqlSession.selectOne("htboardMapper.selectOneBoard", ht_No);
	}

	@Override
	public int updateReadCount(String ht_No) {
		return sqlSession.update("htboardMapper.updateReadCount",ht_No);
	}

	@Override
	public int insertboardComment(board_comment board_comment) {
		return sqlSession.insert("htboardMapper.insertboardComment",board_comment);
	}

	@Override
	public List<board_comment> selectBoardComment(String ht_No) {
		return sqlSession.selectList("htboardMapper.selectBoardComment",ht_No);
	}

	@Override
	public int updateBoardComment(board_comment board_comment) {
		return sqlSession.update("htboardMapper.updateBoardComment",board_comment);
	}

	@Override
	public int deleteBoardComment(int bc_no) {
		return sqlSession.delete("htboardMapper.deleteBoardComment",bc_no);
	}

	@Override
	public int inserthtBoard(ht_board ht_board) {
		return sqlSession.insert("htboardMapper.inserthtBoard",ht_board);
	}

	@Override
	public int boardUpdate(ht_board ht_board) {
		return sqlSession.update("htboardMapper.boardUpdate",ht_board);
	}

	@Override
	public int boardDelete(String ht_No) {
		return sqlSession.delete("htboardMapper.boardDelete",ht_No);
	}

	@Override
	public List<Map<String, String>> htboardSearch(int cPage, int numPerPage, String keyword, String searchType) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		
		return sqlSession.selectList("htboardMapper.htboardSearch", map, rows);
	}

	@Override
	public int htboardSearchCount(String keyword) {
		return sqlSession.update("htboardMapper.htboardSearchCount", keyword);
	}

	
	
	@Override
	public List<Map<String, String>> selecthtBoardListBody(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("htboardMapper.selecthtBoardListBody", null, rows);
	}

	@Override
	public int selecthtBoardTotalContentsBody() {
		int num = sqlSession.selectOne("htboardMapper.selecthtBoardTotalContentsBody");
		return num;
	}


	@Override
	public List<Map<String, String>> selecthtBoardListUp(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("htboardMapper.selecthtBoardListUp", null, rows);
	}


	@Override
	public int selecthtBoardTotalContentsUp() {
		int num = sqlSession.selectOne("htboardMapper.selecthtBoardTotalContentsUp");
		return num;
	}


	@Override
	public List<Map<String, String>> selecthtBoardListLow(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("htboardMapper.selecthtBoardListLow", null, rows);
	}


	@Override
	public int selecthtBoardTotalContentsLow() {
		int num = sqlSession.selectOne("htboardMapper.selecthtBoardTotalContentsLow");
		return num;
	}


	@Override
	public List<Map<String, String>> selecthtBoardListMid(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("htboardMapper.selecthtBoardListMid", null, rows);
	}


	@Override
	public int selecthtBoardTotalContentsMid() {
		int num = sqlSession.selectOne("htboardMapper.selecthtBoardTotalContentsMid");
		return num;
	}


	@Override
	public List<Map<String, String>> selecthtBoardListStret(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("htboardMapper.selecthtBoardListStret", null, rows);
	}


	@Override
	public int selecthtBoardTotalContentsStret() {
		int num = sqlSession.selectOne("htboardMapper.selecthtBoardTotalContentsStret");
		return num;
	}
}
