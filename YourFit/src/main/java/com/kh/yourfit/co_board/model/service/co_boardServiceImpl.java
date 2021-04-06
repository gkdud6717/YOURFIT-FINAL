package com.kh.yourfit.co_board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.common.exception.BoardException;
import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.co_board.model.dao.co_boardDAO;
import com.kh.yourfit.co_board.model.vo.co_board;

@Service
public class co_boardServiceImpl implements co_boardService {
	
	@Autowired
	co_boardDAO co_boardDAO;

	@Override
	public List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage) {
		return co_boardDAO.selectcoBoardList(cPage, numPerPage);
	}
	
	@Override
	public List<Map<String, String>> selectcoBoardListFood(int cPage, int numPerPage) {
		return co_boardDAO.selectcoBoardListFood(cPage, numPerPage);
	}

	@Override
	public int selectcoBoardTotalContents() {
		return co_boardDAO.selectBoardTotalContents();
	}

	@Override
	public int insertcoBoard(co_board co_board, List<board_file> fileList) {
	int result1 = co_boardDAO.insertcoBoard(co_board);
		
	
	  if(result1 == 0 ) throw new BoardException();
	  
	  // 현재 가져온 Attachment들은 boardNo가 없다 이를 해결하려면? // 1. DB에서 가장 최근 생성된 boardNo를 DAO로 가져온다 (생략)
	  // 2. mapper의 insert문에서 selectKey태그 사용 if(fileList.size()>0) {
	  if(fileList.size()>0) {
			for(board_file a : fileList) {
				int result2 = co_boardDAO.insertAttachment(a);
				if(result2 == 0) throw new BoardException("첨부파일 추가 실패!");
			}
		}
		return result1;
	}

	@Override
	public co_board selectOneBoard(String co_No) {
	// return boardDAO.selectOneBoard(boardNo); 조회수 증가 코드 만들기 위해 주석처리	
		co_board co_board = co_boardDAO.selectOneBoard(co_No);
		
		// 조회수 1 증가!
		if(co_board != null) co_boardDAO.updateReadCount(co_No);
		return co_board;
	}
	

	@Override
	public List<board_file> selectfileList(String co_No) {

		return co_boardDAO.selectfileList(co_No);
	}

	@Override
	public co_board updateView(String co_No) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatecoBoard(co_board co_board, List<board_file> fileList) {
		int totalResult = 0;
		
		// 원본 받아오기
		List<board_file> originList = co_boardDAO.selectfileList(co_board.getCo_No());

		totalResult = co_boardDAO.updateBoard(co_board);
		
		if(totalResult == 0) throw new BoardException("게시글 수정 실패!");
		
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if(fileList.size() >0) {
			for(board_file f : fileList) {
				  // update라고 쓰지만, SQL은 insert로
				totalResult = co_boardDAO.updateAttachment(f); 
				
				if(totalResult ==0 ) throw new BoardException("첨부파일 추가 실패");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deletecoBoard(String co_No) {
		return co_boardDAO.deleteBoard(co_No);
	}

	@Override
	public int deleteFile(int f_No) {
		return co_boardDAO.deleteFile(f_No);
	}

	@Override
	public int insertboardComment(board_comment board_comment) {
		
		return co_boardDAO.insertboardComment(board_comment);
	}

	@Override
	public List<board_comment> selectBoardComment(String co_No) {
		return co_boardDAO.selectBoardComment(co_No);
	}

	@Override
	public int deleteBoardComment(int bc_no) {
		return co_boardDAO.deleteBoardComment(bc_no);
	}

	@Override
	public int updateBoardComment(board_comment board_comment) {

		return co_boardDAO.updateBoardComment(board_comment);
	}

	@Override
	public List<Map<String, String>> coboardSearch(int cPage, int numPerPage, String keyword, String searchType) {
		return co_boardDAO.coboardSearch(cPage, numPerPage, keyword, searchType);
	}

	@Override
	public int coboardSearchCount(String keyword) {
		return co_boardDAO.coboardSearchCount(keyword);
	}

	@Override
	public List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage) {
		return co_boardDAO.selectBoardListDiet(cPage, numPerPage);
	}

	@Override
	public int selectcoBoardTotalContentsDiet() {
		return co_boardDAO.selectcoBoardTotalContentsDiet();
	}

	@Override
	public List<Map<String, String>> selectBoardListExer(int cPage, int numPerPage) {
		return co_boardDAO.selectBoardListExer(cPage, numPerPage);
	}

	@Override
	public int selectcoBoardTotalContentsExer() {
		return co_boardDAO.selectcoBoardTotalContentsExer();
	}

	@Override
	public List<Map<String, String>> selectBoardListQA(int cPage, int numPerPage) {
		return co_boardDAO.selectBoardListQA(cPage, numPerPage);
	}

	@Override
	public int selectcoBoardTotalContentsQA() {
		return co_boardDAO.selectcoBoardTotalContentsQA();
	}

	@Override
	public List<Map<String, String>> selectBoardListTip(int cPage, int numPerPage) {
		return co_boardDAO.selectBoardListTip(cPage, numPerPage);
	}

	@Override
	public int selectcoBoardTotalContentTip() {
		return co_boardDAO.selectcoBoardTotalContentTip();
	}

	@Override
	public List<Map<String, String>> selectBoardListToAdmin(int cPage, int numPerPage) {
		return co_boardDAO.selectBoardListToAdmin(cPage, numPerPage);
	}

	@Override
	public int selectcoBoardTotalContentsToAdmin() {
		return co_boardDAO.selectcoBoardTotalContentsToAdmin();
	}





}
