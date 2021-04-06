package com.kh.yourfit.adBoard.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yourfit.adBoard.model.dao.AdBoardDAO;
import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.common.exception.DtBoardException;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Service
public class AdBoardServiceImpl implements AdBoardService {
	
	@Autowired
	AdBoardDAO adBoardDAO;

	@Override
	public int insertBoard(AdBoard adboard, List<board_file> fileList) {
		
		int result1 = adBoardDAO.insertBoard(adboard);
		
		if (result1 == 0) {
			throw new DtBoardException("게시글 등록 오류");
		}
		
		if (fileList.size() > 0) {
			for (board_file bf:fileList) {
				int result2 = adBoardDAO.insertBoardFile(bf);
				if(result2 == 0) {
					throw new DtBoardException("첨부파일 등록 요류");
				}
			}
		}
		return result1;
	}

	@Override
	public AdBoard selectOneBoard(String ad_No) {
		
		AdBoard adboard = adBoardDAO.selectOneBoard(ad_No);
		
		if( adboard != null) adBoardDAO.updateReadCount(ad_No);
				
		return adboard;
	}

	@Override
	public List<board_file> selectBoardFileList(String ad_No) {
		return adBoardDAO.selectBoardFileList(ad_No);
	}

	@Override
	public AdBoard updateView(String ad_No) {
		return adBoardDAO.selectOneBoard(ad_No);
	}

	@Override
	public int updateBoard(AdBoard adboard, List<board_file> boardfileList) {
		int totalResult = 0;
		
		// 원본을 먼저 받아오기
		List<board_file> originList = adBoardDAO.selectBoardFileList(adboard.getAd_No());
		
		totalResult = adBoardDAO.updateBoard(adboard);
		
		if(totalResult == 0) throw new DtBoardException("게시글 수정 실패!");
				
			
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = adBoardDAO.deleteBoardFile(adboard.getAd_No());
			
			if(totalResult == 0) throw new DtBoardException("첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if( boardfileList.size() > 0) {
			for(board_file bf : boardfileList) {
				 // update라고 쓰지만, SQL은 insert로!
				totalResult = adBoardDAO.updateBoardFile(bf);
				
				if( totalResult == 0 ) throw new DtBoardException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteBoard(String ad_No) {
		return adBoardDAO.deleteBoard(ad_No);
	}

}
