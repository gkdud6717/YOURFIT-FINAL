package com.kh.yourfit.dtboard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.common.exception.DtBoardException;
import com.kh.yourfit.dtboard.model.dao.DtBoardDAO;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Service
public class DtBoardServiceImpl implements DtBoardService {
	
	@Autowired
	DtBoardDAO dtBoardDAO;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		return dtBoardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return dtBoardDAO.selectBoardTotalContents();
	}


	@Override
	public int insertBoard(DtBoard dtboard, List<board_file> fileList) {
		int result1 = dtBoardDAO.insertBoard(dtboard);
		
		if( result1 == 0 ) throw new DtBoardException("게시글 등록오류");
		
		if(fileList.size() > 0) {
			for(board_file bf : fileList) {
				int result2 = dtBoardDAO.insertBoardFile(bf);
				if( result2 == 0 ) throw new DtBoardException("첨부파일 등록오류");
			}
		}
		
		return result1;
	}

	@Override
	public DtBoard selectOneBoard(String dt_No) {
		
		DtBoard dtboard = dtBoardDAO.selectOneBoard(dt_No);
		
		if( dtboard != null) dtBoardDAO.updateReadCount(dt_No);
				
		return dtboard;
	}

	@Override
	public List<board_file> selectBoardFileList(String dt_No) {
		
		return dtBoardDAO.selectBoardFileList(dt_No);
	}

	@Override
	public DtBoard updateView(String dt_No) {
		
		return dtBoardDAO.selectOneBoard(dt_No);
	}

	@Override
	public int updateBoard(DtBoard dtboard, List<board_file> boardfileList) {
		int totalResult = 0;
		
		// 원본을 먼저 받아오기
		List<board_file> originList = dtBoardDAO.selectBoardFileList(dtboard.getDt_No());
		
		totalResult = dtBoardDAO.updateBoard(dtboard);
		
		if(totalResult == 0) throw new DtBoardException("게시글 수정 실패!");
				
			
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = dtBoardDAO.deleteBoardFile(dtboard.getDt_No());
			
			if(totalResult == 0) throw new DtBoardException("첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if( boardfileList.size() > 0) {
			for(board_file bf : boardfileList) {
				 // update라고 쓰지만, SQL은 insert로!
				totalResult = dtBoardDAO.updateBoardFile(bf);
				
				if( totalResult == 0 ) throw new DtBoardException("첨부파일 추가 실패!");
			}
		}
		
		
		
		return totalResult;
	}

	@Override
	public int deleteBoard(String dt_No) {
		
		return dtBoardDAO.deleteBoard(dt_No);
	}

	@Override
	public int deleteFile(int fNo) {
		
		return dtBoardDAO.deleteFile(fNo);
	}

	
	@Override
	public int insertboardComment(board_comment board_comment) {
		
		return dtBoardDAO.insertboardComment(board_comment);
	}

	@Override
	public List<board_comment> selectBoardComment(String dt_No) {
		
			System.out.println("dt_No : " + dt_No);
		return dtBoardDAO.selectBoardComment(dt_No);
	}


	@Override
	public List<Map<String, String>> selectBoardListCal(int cPage, int numPerPage) {
		
		return dtBoardDAO.selectBoardListCal(cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectBoardListExe(int cPage, int numPerPage) {
		
		return dtBoardDAO.selectBoardListExe(cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectBoardListDiet(int cPage, int numPerPage) {
		
		return dtBoardDAO.selectBoardListDiet(cPage, numPerPage);
	}

	@Override
	public int deleteBoardComment(int bc_no) {
		
		return dtBoardDAO.deleteBoardComment(bc_no);
	}

	@Override
	public int updateBoardComment(board_comment board_comment) {
		
		return dtBoardDAO.updateBaordComment(board_comment);
	}

	@Override
	public List<Map<String, String>> dtBoardSearch(int cPage, int numPerPage, String keyword, String searchType) {
		
		return dtBoardDAO.dtBoardSearch(cPage, numPerPage, keyword, searchType);
	}

	@Override
	public int dtBoardSearchCount(String keyword) {
		
		return dtBoardDAO.dtBoardSerchCount(keyword);
	}

	

	

	

}
