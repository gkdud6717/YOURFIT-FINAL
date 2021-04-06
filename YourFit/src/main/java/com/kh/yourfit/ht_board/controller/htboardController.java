package com.kh.yourfit.ht_board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.ht_board.model.service.ht_boardService;
import com.kh.yourfit.ht_board.model.vo.ht_board;

@Controller
public class htboardController {
	
	@Autowired
	ht_boardService ht_boardService;
	
	@RequestMapping("/HomeTraining/htList.do")
	public String htList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 9; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = ht_boardService.selecthtBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = ht_boardService.selecthtBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "htList.do");

		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
	
		return "HomeTraining/htList";
	}
	
	@RequestMapping("/HomeTraining/htListBody.do")
	public String selectBoardListBody(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = ht_boardService.selecthtBoardListBody(cPage, numPerPage);
		
		int totalContents = ht_boardService.selecthtBoardTotalContentsBody();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "htListBody.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "HomeTraining/htList";
	}
	
	@RequestMapping("/HomeTraining/htListUp.do")
	public String selectBoardListUp(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = ht_boardService.selecthtBoardListUp(cPage, numPerPage);
		
		int totalContents = ht_boardService.selecthtBoardTotalContentsUp();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "htListUp.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "HomeTraining/htList";
	}
	
	@RequestMapping("/HomeTraining/htListLow.do")
	public String selectBoardListLow(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = ht_boardService.selecthtBoardListLow(cPage, numPerPage);
		
		int totalContents = ht_boardService.selecthtBoardTotalContentsLow();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "htListLow.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "HomeTraining/htList";
	}
	
	@RequestMapping("/HomeTraining/htListMid.do")
	public String selectBoardListMid(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = ht_boardService.selecthtBoardListMid(cPage, numPerPage);
		
		int totalContents = ht_boardService.selecthtBoardTotalContentsMid();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "htListMid.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "HomeTraining/htList";
	}
	
	@RequestMapping("/HomeTraining/htListStret.do")
	public String selectBoardListStret(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = ht_boardService.selecthtBoardListStret(cPage, numPerPage);
		
		int totalContents = ht_boardService.selecthtBoardTotalContentsStret();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "htListStret.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "HomeTraining/htList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/HomeTraining/boardView.do")
	public String boardView(@RequestParam String no, Model model) {
		ht_board ht_board = ht_boardService.selectOneBoard(no);
		
		List<board_comment> bclist = ht_boardService.selectBoardComment(no);
		/* List<board_file> board_file = ht_boardService.selectfileList(no); */
		model.addAttribute("ht_board",ht_board);
		/* model.addAttribute("board_file",board_file); */
		model.addAttribute("bclist", bclist);
		System.out.println("선택한 ht_board : " + ht_board);
		
		return "HomeTraining/htboardView";
	}
	
	@RequestMapping("/HomeTraining/htboardForm.do")
	public String htboardForm() {
		
		return "HomeTraining/htboardForm";
	}
	

	
	@RequestMapping("/HomeTraining/commentinsert.do")
	public String insertComment(@RequestParam String ht_No, @RequestParam String htContent, @RequestParam int memberMno, Model model) {
		
		board_comment board_comment = new board_comment();
		board_comment.setBc_Htno(ht_No);
		board_comment.setBc_Content(htContent);
		board_comment.setBc_Mno(memberMno);
		System.out.println("나와라" + board_comment);
		
	    int result = ht_boardService.insertboardComment(board_comment);
	    
	    model.addAttribute("no", ht_No);
		
		return "redirect:/HomeTraining/boardView.do";
	}
	
	
	@RequestMapping("/HomeTraining/commentlist.do") // 게시글번호   
	public String listComment(@RequestParam String ht_No, Model model) {
		
		List<board_comment> bclist = ht_boardService.selectBoardComment(ht_No);
		
		System.out.println("bclist" + bclist);
	
	    model.addAttribute("no", ht_No);
		// bclist boardview 에서 넘겨줌
	    return "redirect:/HomeTraining/boardView.do";
		
	}
	
	@RequestMapping("/HomeTraining/commentupdate.do")    //세부적인 url pattern
    public String reply_update (@RequestParam int bc_no, @RequestParam String bc_content, @RequestParam String ht_no,
            board_comment board_comment, Model model) throws Exception{
        
		
        board_comment.setBc_No(bc_no);
        board_comment.setBc_Content(bc_content);
        
        int result = ht_boardService.updateBoardComment(board_comment);
 

		model.addAttribute("no", ht_no);
        
		return "redirect:/HomeTraining/boardView.do";
    }
	
	@RequestMapping("/HomeTraining/commentdelete.do")
	public String commentdelete (@RequestParam int bc_no, @RequestParam String ht_no, Model model) {
		System.out.println(bc_no);
		System.out.println(ht_no);
		
		int result ;
		result = ht_boardService.deleteBoardComment(bc_no);
		
		  model.addAttribute("no", ht_no);
		
		return "redirect:/HomeTraining/boardView.do";
		
		
	}
	
	@RequestMapping("/HomeTraining/htboardFormEnd.do")
	public String inserthtBoard(ht_board ht_board, Model model ) {
		
				// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성 
			// String saveDirectory = req.getServletContext().getRealPath("/resources/boardUpload");
				// 첨부파일 저장해서 데이터베이스에 전달할 객체 리스트 생성
			//	List<board_file> fileList = new ArrayList<board_file>();
				
				/*** MultipartFile 로 파일 업로드 처리하기 ***/
				/*
				 * for(MultipartFile f : upFiles) { if( f.isEmpty() == false) { // 2. 파일명 재생성
				 * String f_Name = f.getOriginalFilename(); String f_Cname =
				 * fileNameChanger(f_Name);
				 * 
				 * try { f.transferTo(new File(saveDirectory + "/" + f_Cname)); } catch
				 * (IllegalStateException | IOException e) { e.printStackTrace(); } // 3. list에
				 * 담기 board_file bf = new board_file(); bf.setF_Name(f_Name);
				 * bf.setF_Cname(f_Cname);
				 * 
				 * fileList.add(bf); } }
				 */
		
				
				int result = ht_boardService.inserthtBoard(ht_board);
				return "redirect:/HomeTraining/htList.do";
	}
	
	@RequestMapping("/HomeTraining/boardUpdateView.do")
	public String boardUpdateView(@RequestParam String ht_No, Model model) {
		
		ht_board ht_board = ht_boardService.selectOneBoard(ht_No);
		System.out.println("ht_board 잘가져왔니" + ht_board);
		
		model.addAttribute("ht_board", ht_board);

		
		return "HomeTraining/htboardUpdateView";
		
	}
	
	@RequestMapping("/HomeTraining/boardUpdate.do")
	public String boardUpdate(ht_board ht_board, Model model) {
		
		int result = ht_boardService.boardUpdate(ht_board);
		
		return "redirect:/HomeTraining/htList.do";
	}
	
	@RequestMapping("/HomeTraining/boardDelete.do")
	public String boardDelete(@RequestParam String ht_No) {
		
		int result = ht_boardService.boardDelete(ht_No);
		
		return "redirect:/HomeTraining/htList.do";
	}
	
	@RequestMapping("/HomeTraining/boardSearch.do")
	public String boardSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
            @RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
            @RequestParam(value="searchType", required=false, defaultValue="title") String searchType, Model model) {
			
			int numPerPage = 10;
			
			List<Map<String, String>> list = ht_boardService.htboardSearch(cPage, numPerPage, keyword, searchType);
			
			int count = ht_boardService.htboardSearchCount(keyword);
			
			String pageBar = Utils.getPageBar(count, cPage, numPerPage, "boardSearch.do");
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("searchType", searchType);
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);
			
			return "HomeTraining/htListSearch";
		}
	
}
