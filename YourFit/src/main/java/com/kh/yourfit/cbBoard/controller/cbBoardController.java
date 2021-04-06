package com.kh.yourfit.cbBoard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.yourfit.cbBoard.model.service.cbBoardService;
import com.kh.yourfit.cbBoard.model.vo.cbBoard;
import com.kh.yourfit.common.util.Utils;


@Controller
public class cbBoardController {
	
	@Autowired
	cbBoardService cbBoardService;
	
	@RequestMapping("/cbBoard/cbBoard.do")
	public String cbBoard(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글
		
		// 현재 페이지 게시글 
		List<Map<String, String>> list = cbBoardService.selectcbBoard(cPage, numPerPage);
		
		// 전체 게시글 수
		int totalContents = cbBoardService.selectcbBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "cbBoard.do");
				
		// System.out.println("list : " + list);
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "cbBoard/cbBoard";
	}
	
	@RequestMapping("/cbBoard/cbBoardView.do")
	public String cbBoardView(@RequestParam String cb_no, Model model) {
		
		cbBoard cbBoard = cbBoardService.selectOnecbBoard(cb_no);
		
		model.addAttribute("cbBoard", cbBoard);
		
		return "cbBoard/cbBoardView";
	}
	
	@RequestMapping("/cbBoard/cbBoardSearch.do")
	public String cbBoardSearch(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, @RequestParam String keyword, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글
		
		// 검색한 현재 페이지 게시글 
		List<Map<String, String>> list = cbBoardService.cbBoardSearch(cPage, numPerPage, keyword);
		
		// 검색된 게시글 수
		int count = cbBoardService.cbBoardSearchCnt(keyword);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(count, cPage, numPerPage, "cbBoardSearch.do");
						
		// System.out.println("list : " + list);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
				
		return "cbBoard/cbBoardSearch";
	}
	
}
