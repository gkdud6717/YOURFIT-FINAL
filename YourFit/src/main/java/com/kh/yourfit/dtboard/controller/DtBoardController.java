package com.kh.yourfit.dtboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.dtboard.model.service.DtBoardService;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Controller
public class DtBoardController {
	
	@Autowired
	DtBoardService dtBoardService;
	
	@RequestMapping("/dtboard/dtBoardList.do")
	public String selectDtBoardList(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = dtBoardService.selectBoardList(cPage, numPerPage);
		
		int totalContents = dtBoardService.selectBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "dtBoardList.do");
		
		//System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "dtboard/dtBoardList";
	}
	
	@RequestMapping("/dtboard/dtBoardListCal.do")
	public String selectDtBoardListCal(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = dtBoardService.selectBoardListCal(cPage, numPerPage);
		
		int totalContents = dtBoardService.selectBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "dtBoardListCal.do");
		
		// System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "dtboard/dtBoardListCal";
	}
	
	@RequestMapping("/dtboard/dtBoardListExe.do")
	public String selectDtBoardListExe(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = dtBoardService.selectBoardListExe(cPage, numPerPage);
		
		int totalContents = dtBoardService.selectBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "dtBoardListExe.do");
		
		//System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "dtboard/dtBoardListExe";
	}
	@RequestMapping("/dtboard/dtBoardListDiet.do")
	public String selectDtBoardListDiet(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = dtBoardService.selectBoardListDiet(cPage, numPerPage);
		
		int totalContents = dtBoardService.selectBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "dtBoardListDiet.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "dtboard/dtBoardListDiet";
	}
	
	@RequestMapping("/dtboard/dtBoardForm.do")
	public void dtBoardForm() { }
	
	@RequestMapping("/dtboard/dtBoardFormEnd.do")
	public String insertDtBoard(DtBoard dtboard, Model model, HttpServletRequest req,
			@RequestParam(value="upfiles", required=false) MultipartFile[] upFiles) {
		
			// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
				String saveDirectory
				      = req.getServletContext().getRealPath("/resources/dtboardUpload");
				List<board_file> fileList = new ArrayList<board_file>();
				
				for(MultipartFile f : upFiles) {
					  System.out.println("결과 : " + f.getOriginalFilename());
					if( f.isEmpty() == false) {
						
						String originName = f.getOriginalFilename();
						String changeName = fileNameChanger(originName);
						
						try {
							f.transferTo(new File(saveDirectory + "/" + changeName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						// 3. list에 담기
						board_file bf = new board_file();
						bf.setF_Name(originName);
						bf.setF_Cname(changeName);
						
						fileList.add(bf);
					}
				}
				
				int result = dtBoardService.insertBoard(dtboard, fileList);
				
				String loc = "/dtboard/dtBoardList.do";
				String msg = "";
				if( result > 0 ) {
					msg = "게시글 등록 성공";
				} else {
					msg = "게시글 등록 실패!";
				}
				
				
				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);
				
		return "/common/msg";
	}
	
	@RequestMapping("/dtboard/dtBoardView.do")
	public String dtBoardView(@RequestParam String no , Model model) {
		
		DtBoard dtboard = dtBoardService.selectOneBoard(no);
		List<board_file> boardfileList = dtBoardService.selectBoardFileList(no);
		List<board_comment> bclist = dtBoardService.selectBoardComment(no);
		
		model.addAttribute("dtboard", dtboard);
		model.addAttribute("boardfileList", boardfileList);
		model.addAttribute("bclist", bclist);
		
		//System.out.println("bclist" + bclist);
		
		return "dtboard/dtBoardView";
	}
	
	@RequestMapping("/dtboard/dtBoardUpdateView.do")
	public String dtBoardUpdateView(@RequestParam String dt_No, Model model) {
		
		DtBoard dtboard = dtBoardService.updateView(dt_No);
		List<board_file> boardfileList = dtBoardService.selectBoardFileList(dt_No);
		
		model.addAttribute("dtboard", dtboard);
		model.addAttribute("boardfileList", boardfileList);
		
		//System.out.println("dtboard" + dtboard);
		//System.out.println("boardfileList" + boardfileList);
		
		return "dtboard/dtBoardUpdateView";
	}
	
	@RequestMapping("/dtboard/dtBoardUpdate.do")
	public String boardUpdate(DtBoard dtboard,
						@RequestParam(value="upfiles", required=false) MultipartFile[] upFiles,
						HttpServletRequest req, Model model) {
		
		System.out.println("dtBoardUpdate : " + dtboard);
		
		String dt_No = dtboard.getDt_No();
		
		
		DtBoard originBoard = dtBoardService.updateView(dt_No);
		//System.out.println("originBoard: " + originBoard);
		
			
		originBoard.setDt_Title(dtboard.getDt_Title());
		originBoard.setDt_Content(dtboard.getDt_Content());

			
		// 1. 파일 저장 경로 선언   
		String saveDirectory = req.getServletContext().getRealPath("/resources/dtboardUpload");
			
		// 원본 첨부파일 목록
		List<board_file> boardfileList = dtBoardService.selectBoardFileList(dt_No);
		if( boardfileList == null ) boardfileList = new ArrayList<board_file>();
			//System.out.println("결과1 : " + boardfileList);
		// 2. 변경한 파일 정보 업로드 시작!
		int idx = 0;
		for(MultipartFile f : upFiles) {
			board_file bf = null;
				
				if( f.isEmpty() == false ) {
					
					//System.out.println("새로 들어온 파일 : " + f);
					//System.out.println("삭제 되어야 할 파일 : " + saveDirectory +"/" + boardfileList.get(idx).getF_Cname());
					// 원본 파일 삭제
					if( boardfileList.size() > idx) {
						boolean fileDelete
						   = new File(saveDirectory +"/" + boardfileList.get(idx).getF_Cname()).delete();
						
						//System.out.println("파일 삭제 여부 확인 : " + fileDelete);
						
						bf = boardfileList.get(idx);
					} else {
						bf = new board_file();
						bf.setDt_No(dt_No);
					
						boardfileList.add(bf);
						
					}
					
					// 파일 이름 변경하기
					String originName = f.getOriginalFilename();
					String changeName = fileNameChanger(originName);
					
					// 실제 파일 저장
					try {
						f.transferTo(new File(saveDirectory + "/" + changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
						
					}
					
					//System.out.println("결과2 : " + boardfileList);
					
					bf.setF_Name(originName);
					bf.setF_Cname(changeName);
					
					boardfileList.set(idx, bf);
					
					//System.out.println("결과3 : " + boardfileList);
					
				}
				idx++;	
			}
			
			// 3. update 서비스 실행
			int result = dtBoardService.updateBoard(originBoard, boardfileList);
			String loc = "/dtboard/dtBoardList.do";
			String msg = "";
			
			if( result > 0 ) {
				msg = "게시글 수정 성공!";
			} else {
				msg = "게시글 수정 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
	
			//System.out.println("originBoard : " + originBoard);
			//System.out.println("boardfileList : " + boardfileList);
	
	return "common/msg";
	}
	
	@RequestMapping("/dtboard/dtBoardDelete.do")
	public String dtBoardDelete(@RequestParam String dt_No, HttpServletRequest req, Model model) {
		
		// 1. 파일이 저장된 폴더 경로
			String saveDir = req.getServletContext().getRealPath("/resources/dtboardUpload");
				
			// 첨부파일 삭제 명단
			List<board_file> delList = dtBoardService.selectBoardFileList(dt_No);
				
			// 2. DB 정보 삭제하기
			int result = dtBoardService.deleteBoard(dt_No);
				
			String loc = "/dtboard/dtBoardList.do";
			String msg = "";
				
			if ( result > 0 ) {
					msg = "게시글 삭제 완료!";
					
					// 3. 실제 파일 지우기
					for(board_file bf : delList) {
						new File(saveDir + "/" + bf.getF_Cname()).delete();
					}
					
				} else {
					msg = "게시글 삭제 실패!";
				}
				
				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);
				
				return "common/msg";
	}
	
	@RequestMapping("/dtboard/dtfileDelete.do")
	@ResponseBody
	public boolean dtfileDelete(@RequestParam int fNo,
			                    @RequestParam String cName,
			                     HttpServletRequest req) {
		
		String saveDir = req.getServletContext().getRealPath("/resources/dtboardUpload");
		
		boolean check = dtBoardService.deleteFile(fNo) != 0 ? true : false;
		
		if( check == true ) {
			new File(saveDir + "/" + cName).delete();
		}
		
		
		return check;
	}
	
	@RequestMapping("/dtboard/commentInsert.do") // 게시글번호               // 게시글 내용                  // 댓글 단 회원번호
	public String insertComment(@RequestParam String dt_No, @RequestParam String coContent, @RequestParam int memberMno, Model model) {
			
			board_comment board_comment = new board_comment();
			board_comment.setBc_Mno(memberMno);
			board_comment.setBc_Dtno(dt_No);
			board_comment.setBc_Content(coContent);
			
		    int result = dtBoardService.insertboardComment(board_comment);
		    
		    String loc = "/dtboard/dtBoardView.do";
			String msg = "";
		    System.out.println("result : " + result);
		    
		    if( result > 0 ) {
				msg = "게시판 댓글 성공!";
			} else {
				msg = "게시판 댓글 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			model.addAttribute("dt_No", dt_No);
			
		  
		return "common/msg";
	}
	
	@RequestMapping("/dtboard/commentlist.do")
	@ResponseBody
	public List<board_comment> listComment(@RequestParam String dt_No, Model model) {
		
		List<board_comment> bclist = dtBoardService.selectBoardComment(dt_No);
	
		 return bclist;
	
	 
	}
	
	@RequestMapping("/dtboard/commentUpdate")
	public String updateComment(@RequestParam int bc_no,
								@RequestParam String bc_content,
								@RequestParam String dt_no,
								board_comment board_comment, Model model) {
	
		board_comment.setBc_No(bc_no);
		board_comment.setBc_Content(bc_content);
		

		System.out.println("결과값 : " + board_comment);
		
		int result = dtBoardService.updateBoardComment(board_comment);
		
		model.addAttribute("no", dt_no);
		
		
		
		return "redirect:/dtboard/dtBoardView.do";
	}
	
	@RequestMapping("/dtboard/commentDelete.do")
	public String commentDelete (@RequestParam int bc_no, @RequestParam String dt_no, Model model) {
		System.out.println(bc_no);
		System.out.println(dt_no);
		
		int result;
		result = dtBoardService.deleteBoardComment(bc_no);
		
		  model.addAttribute("no", dt_no);
		
		return "redirect:/dtboard/dtBoardView.do";
	}
	
	@RequestMapping("/dtboard/dtBoardSearch.do")
	public String dtBoardSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			                    @RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
			                    @RequestParam(value="searchType", required=false, defaultValue="title") String searchType, Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = dtBoardService.dtBoardSearch(cPage, numPerPage, keyword, searchType);
		
		int count = dtBoardService.dtBoardSearchCount(keyword);
		
		String pageBar = Utils.getPageBar(count, cPage, numPerPage, "dtBoardSearch.do");
		
		System.out.println("list2" + list);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchType", searchType);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "dtboard/dtBoardListSearch";
	}

	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}
	
	
	
	
	
}
