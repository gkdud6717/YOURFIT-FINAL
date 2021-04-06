package com.kh.yourfit.co_board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.co_board.model.vo.co_board;

@Repository
public class co_boardDAOImpl implements co_boardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage) {
		 // RowBounds : 전체 게시글중 특정 게시글만 갖고 오게 하기
	      // 1페이지면 (0,10): 0번부터 10개 0~9게시글 , 2 페이지면 (1,10) : 10번부터 10개 10~19게시글
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
									// 줄건없지만 rows를 통해 자를것이다
		System.out.println(sqlSession.selectList("coboardMapper.selectcoBoardList", null, rows));
		return sqlSession.selectList("coboardMapper.selectcoBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		int num = sqlSession.selectOne("coboardMapper.selectBoardTotalContents");
	
		return num;
	}

	@Override
	public int insertcoBoard(co_board co_board) {
		return sqlSession.insert("coboardMapper.insertBoard", co_board);
	}

	@Override
	public int insertAttachment(board_file a) {
		return sqlSession.insert("coboardMapper.insertAttachment", a);
	}

	@Override
	public co_board selectOneBoard(String co_No) {

		return sqlSession.selectOne("coboardMapper.selectOneBoard", co_No);
	}


	@Override
	public List<board_file> selectfileList(String co_No) {
		return sqlSession.selectList("coboardMapper.selectFileList", co_No);
	}

	@Override
	public int updateReadCount(String co_No) {
		return sqlSession.update("coboardMapper.updateReadCount",co_No);
		
	}

	@Override
	public int updateBoard(co_board co_board) {
		return sqlSession.update("coboardMapper.updateBoard", co_board);
	}

	@Override
	public int updateAttachment(board_file board_file) {
		return sqlSession.insert("coboardMapper.updateAttachment", board_file);
	}

	@Override
	public int deleteBoard(String co_No) {
		return sqlSession.delete("coboardMapper.deleteBoard", co_No);
	}

	@Override
	public int deleteAttachment(String co_No) {
		return sqlSession.delete("coboardMapper.deleteAttachment", co_No);
	}

	@Override
	public int deleteFile(int f_No) {
		return sqlSession.delete("coboardMapper.deleteFile", f_No);
	}

	@Override
	public List<Map<String, String>> selectcoBoardListFood(int cPage, int numPerPage) {
			RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
			return sqlSession.selectList("coboardMapper.selectcoBoardListFood", null, rows);
	}

	

	@Override
	public int insertboardComment(board_comment board_comment) {
		return sqlSession.insert("coboardMapper.insertboardComment", board_comment);
	}

	@Override
	public List<board_comment> selectBoardComment(String co_No) {
		return sqlSession.selectList("coboardMapper.selectBoardComment", co_No);
	}

	@Override
	public int deleteBoardComment(int bc_no) {

		return sqlSession.delete("coboardMapper.deleteBoardComment", bc_no);
	}

	@Override
	public int updateBoardComment(board_comment board_comment) {
		return sqlSession.update("coboardMapper.updateBoardComment", board_comment);
	}

	@Override
	public List<Map<String, String>> coboardSearch(int cPage, int numPerPage, String keyword, String searchType) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		System.out.println("map" + map);
		
		return sqlSession.selectList("coboardMapper.coboardSearch", map, rows);
	}

	@Override
	public int coboardSearchCount(String keyword) {
		return sqlSession.update("coboardMapper.coboardSearchCount", keyword);
	}

	@Override
	public List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("coboardMapper.selectBoardListDiet", null, rows);
	}

	@Override
	public int selectcoBoardTotalContentsDiet() {
		int nul = sqlSession.selectOne("coboardMapper.selectcoBoardTotalContentsDiet");
		return nul;
	}

	@Override
	public List<Map<String, String>> selectBoardListExer(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("coboardMapper.selectBoardListExer", null, rows);
	}

	@Override
	public int selectcoBoardTotalContentsExer() {
		int num = sqlSession.selectOne("coboardMapper.selectcoBoardTotalContentsExer");
		return num;
	}

	@Override
	public List<Map<String, String>> selectBoardListQA(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("coboardMapper.selectBoardListQA", null, rows);
	}

	@Override
	public int selectcoBoardTotalContentsQA() {
		int num = sqlSession.selectOne("coboardMapper.selectcoBoardTotalContentsQA");
		return num;
	}

	@Override
	public List<Map<String, String>> selectBoardListTip(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("coboardMapper.selectBoardListTip", null, rows);
	}

	@Override
	public int selectcoBoardTotalContentTip() {
		int num = sqlSession.selectOne("coboardMapper.selectcoBoardTotalContentTip");
		return num;
	}

	@Override
	public List<Map<String, String>> selectBoardListToAdmin(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("coboardMapper.selectBoardListToAdmin", null, rows);
	}

	@Override
	public int selectcoBoardTotalContentsToAdmin() {
		int num = sqlSession.selectOne("coboardMapper.selectcoBoardTotalContentsToAdmin");
		return num;
	}








}
