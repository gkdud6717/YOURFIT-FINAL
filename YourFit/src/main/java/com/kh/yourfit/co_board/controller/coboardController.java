package com.kh.yourfit.co_board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.co_board.model.service.co_boardService;
import com.kh.yourfit.co_board.model.vo.co_board;
import com.kh.yourfit.common.util.Utils;


@Controller
public class coboardController {

	
	@Autowired
	co_boardService co_boardService;

	@RequestMapping("/board/coList.do")
	public String coList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = co_boardService.selectcoBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = co_boardService.selectcoBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "coList.do");

		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
	
		return "board/coList";
	}
	
	@RequestMapping("/board/coListDiet.do")
	public String selectBoardListDiet(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = co_boardService.selectBoardListDiet(cPage, numPerPage);
		
		int totalContents = co_boardService.selectcoBoardTotalContentsDiet();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "coListDiet.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "board/coList";
	}
	
	@RequestMapping("/board/coListExer.do")
	public String selectBoardListExer(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = co_boardService.selectBoardListExer(cPage, numPerPage);
		
		int totalContents = co_boardService.selectcoBoardTotalContentsExer();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "coListExer.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "board/coList";
	}
	
	@RequestMapping("/board/coListQA.do")
	public String selectBoardListQA(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = co_boardService.selectBoardListQA(cPage, numPerPage);
		
		int totalContents = co_boardService.selectcoBoardTotalContentsQA();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "coListQA.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "board/coList";
	}
	
	@RequestMapping("/board/coListTip.do")
	public String selectBoardListTip(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = co_boardService.selectBoardListTip(cPage, numPerPage);
		
		int totalContents = co_boardService.selectcoBoardTotalContentTip();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "coListTip.do");
		
		System.out.println("tip 왔니..? list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "board/coList";
	}
	
	@RequestMapping("/board/coListToAdmin.do")
	public String selectBoardListToAdmin(
				@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
	
		List<Map<String, String>> list = co_boardService.selectBoardListToAdmin(cPage, numPerPage);
		
		int totalContents = co_boardService.selectcoBoardTotalContentsToAdmin();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "coListToAdmin.do");
		
		//cPage.System.out.println("list : " + list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "board/coList";
	}


	@RequestMapping("/board/coboardForm.do")
	public String coboardForm() {
		
		return "board/coboardForm";
	}

	@RequestMapping("/board/coboardFormEnd.do")
	public String insertcoBoard(co_board co_board, Model model, HttpServletRequest req,
			@RequestParam(value="upFile", required=false)MultipartFile[] upFiles) {
		
				// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성 
				String saveDirectory = req.getServletContext().getRealPath("/resources/boardUpload");
				// 첨부파일 저장해서 데이터베이스에 전달할 객체 리스트 생성
				List<board_file> fileList = new ArrayList<board_file>();
				
				/*** MultipartFile 로 파일 업로드 처리하기 ***/
				for(MultipartFile f : upFiles) {
					if( f.isEmpty() == false) {
						// 2. 파일명 재생성
						String f_Name = f.getOriginalFilename();
						String f_Cname = fileNameChanger(f_Name);
						
						try {
							f.transferTo(new File(saveDirectory + "/" + f_Cname));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						// 3. list에 담기
						board_file bf = new board_file();
						bf.setF_Name(f_Name);
						bf.setF_Cname(f_Cname);
						
						fileList.add(bf);
					}						
				}
				
				
				int result = co_boardService.insertcoBoard(co_board, fileList);	
				return "redirect:/board/coList.do";
	}
	
	@RequestMapping("/board/commentinsert.do") // 게시글번호               // 게시글 내용                  // 댓글 단 회원번호
	public String insertComment(@RequestParam String co_No, @RequestParam String coContent, @RequestParam int memberMno, Model model) {
			
			board_comment board_comment = new board_comment();
			board_comment.setBc_Mno(memberMno);
			board_comment.setBc_Cono(co_No);
			board_comment.setBc_Content(coContent);
		    int result = co_boardService.insertboardComment(board_comment);
			
		
		
			  model.addAttribute("no", co_No);
			
		  
		return "redirect:/board/boardView.do";
	}
	
	@RequestMapping("/board/commentlist.do") // 게시글번호   
	public String listComment(@RequestParam String co_No, Model model) {
		
		List<board_comment> bclist = co_boardService.selectBoardComment(co_No);
		
		System.out.println("bclist" + bclist);
	
		model.addAttribute("no", co_No);
		
		return "redirect:/board/boardView.do";
		
	 
	}
	
	
	@RequestMapping("/board/commentupdate.do")    //세부적인 url pattern
    public String reply_update (@RequestParam int bc_no, @RequestParam String bc_content, @RequestParam String co_no,
            board_comment board_comment, Model model) throws Exception{
        
		
        board_comment.setBc_No(bc_no);
        board_comment.setBc_Content(bc_content);
        
        int result = co_boardService.updateBoardComment(board_comment);
 

		model.addAttribute("no", co_no);
        
		return "redirect:/board/boardView.do";
    }
	
	@RequestMapping("/board/commentdelete.do")
	public String commentdelete (@RequestParam int bc_no, @RequestParam String co_no, Model model) {
		System.out.println(bc_no);
		System.out.println(co_no);
		
		int result ;
		result = co_boardService.deleteBoardComment(bc_no);
		
		  model.addAttribute("no", co_no);
		
		return "redirect:/board/boardView.do";
	}
	
	
	@RequestMapping("/board/boardView.do")
	public String boardView(@RequestParam String no, Model model) {
		co_board co_board = co_boardService.selectOneBoard(no);
		
		
		List<board_file> board_file = co_boardService.selectfileList(no);
		List<board_comment> bclist = co_boardService.selectBoardComment(no);
		
		model.addAttribute("co_board",co_board);
		model.addAttribute("board_file",board_file);
		model.addAttribute("bclist", bclist);
		System.out.println("선택한 co_board : " + co_board);
		return "board/coboardView";
	}
	
	@RequestMapping("/board/fileDownload.do")
	public void fileDownload(@RequestParam String oName,
							   @RequestParam String rName,
							   HttpServletRequest request,
							   HttpServletResponse response){
		
		//파일저장디렉토리
		String saveDirectory = request.getServletContext().getRealPath("/resources/boardUpload");	
	
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
			 
		try {
			sos = response.getOutputStream();
			File savedFile = new File(saveDirectory + "/" + rName);
			response.setContentType("application/octet-stream; charset=utf-8");

			// 한글 파일 명 처리 : 브라우져에 따른 인코딩 처리 선택
			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 
						  || request.getHeader("user-agent").indexOf("Trident") != -1;
			System.out.println("isMSIE="+isMSIE);
			if(isMSIE){
				// ie는 utf-8 인코딩을 명시적으로 선언 해줘야 한다. 
				// 또한 공백을 의미하는 ' '기호가 +로 변하기 때문에, 이를 %20로 치환해준다.
				// 그럼 진짜 '+'기호는...?? ==> '+'기호는 그에 맞는 유니코드로 치환되기 때문에 상관 X
				resFilename = URLEncoder.encode(oName, "UTF-8");
				System.out.println("ie : "+resFilename); //ie : %eb%82%98%eb%8a%94+%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
									
				resFilename = resFilename.replaceAll("\\+", "%20");
				System.out.println("ie : "+resFilename); //ie : %eb%82%98%eb%8a%94%20%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
			} else {
				// 다른 웹 브라우저 중 ISO-8859-1(EUC-KR)로 되어 있는 경우 인코딩 진행
				resFilename = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
				System.out.println("not ie : "+resFilename);
				
			}
			response.addHeader("Content-Disposition",
					"attachment; filename=\"" + resFilename + "\"");

			//파일크기지정
			response.setContentLength((int)savedFile.length());

			FileInputStream fis = new FileInputStream(savedFile);
			bis = new BufferedInputStream(fis);
			int read = 0;

			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}

	}

	@RequestMapping("/board/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int attNo, @RequestParam String rName,
								HttpServletRequest req) {
		String saveDir = req.getServletContext().getRealPath("/resources/boardUpload");
		
		boolean check = co_boardService.deleteFile(attNo) !=0? true : false;
		
		if(check == true) {
			new File(saveDir+ "/" +rName).delete();
		}
		return check;
	}
	
	@RequestMapping("/board/boardUpdateView.do")
	public String boardUpdateView(@RequestParam String co_No, Model model) {
		
		co_board co_board = co_boardService.selectOneBoard(co_No);
		List<board_file> board_file = co_boardService.selectfileList(co_No);
		
		model.addAttribute("co_board", co_board);
		model.addAttribute("board_file", board_file);
		
		return "board/coboardUpdateView";
	}
	
	// 단순 파일 이름 변경용 메소드
		public String fileNameChanger(String oldFileName) {
			
			// 확장자 추출
			String ext = oldFileName.substring(oldFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd__HHmmssSSS");
			int rnd = (int)(Math.random() * 1000);
			return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." +ext;
		}
		
		
		@RequestMapping("/board/boardUpdate.do")
		public String boardUpdate(co_board co_board,
								  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
								  HttpServletRequest req, Model model) {
			System.out.println("co_board" + co_board);
	
			String co_No = co_board.getCo_No(); 
			
			co_board originBoard = co_boardService.selectOneBoard(co_No); 
			System.out.println("originboard" + originBoard);
			
			originBoard.setCo_Title(co_board.getCo_Title());
			originBoard.setCo_Content(co_board.getCo_Content());
			

			
			// 1. 파일 저장 경로 선언
			String saveDirectory = req.getServletContext().getRealPath("/resources/boardUpload");
			
			// 원본 첨부파일 불러오기
			List<board_file> board_file = co_boardService.selectfileList(co_No);
			
			if(board_file == null) board_file = new ArrayList<board_file>();
			
			// 2. 변경한 파일 정보 업로드
			int idx = 0;
			for(MultipartFile f : upFiles) {
				board_file at = null;
				
				if(f.isEmpty() == false) {  // 새 첨부파일이 있다면
					// 원본 파일 삭제
					if(board_file.size() > idx) {
						boolean fileDelete  // 삭제가 잘 되면 true , 안되면 false 돌려줌
							= new File(saveDirectory + "/" +board_file.get(idx).getF_Cname()).delete();
						
						System.out.println("파일 삭제 여부 확인 :" +fileDelete);
						
						at = board_file.get(idx);
					} else {
						at = new board_file();
						at.setCo_No(co_No);
						
						board_file.add(at);
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
					
					at.setF_Name(originName);
					at.setF_Cname(changeName);
					
					board_file.set(idx, at);
				}
				
				idx++;
			}
			
			// 3. update 서비스 실행
			int result = co_boardService.updatecoBoard(originBoard, board_file);
		
			
			return "redirect:/board/coList.do";
		}	
		
		@RequestMapping("/board/boardDelete.do")			// 사진도 삭제해줘야 하기 때문에
		public String boardDelete(@RequestParam String co_No, HttpServletRequest req, Model model) {
			// 1. 파일이 저장된 폴더 경로
			String saveDir = req.getServletContext().getRealPath("/resources/boardUpload");
			
			// 첨부파일 삭제 명단
			List<board_file> delList = co_boardService.selectfileList(co_No);
			// 2. DB 정보 삭제하기
			int result = co_boardService.deletecoBoard(co_No);

			if (result>0) {
				
				// 3. 실제 파일 지우기
				for(board_file a : delList) {
					new File(saveDir + "/" + a.getF_Cname()).delete();
				}
			} 
				
			return "redirect:/board/coList.do";
		}
		
		@RequestMapping("/board/boardSearch.do")
		public String BoardSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
                @RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
                @RequestParam(value="searchType", required=false, defaultValue="title") String searchType, Model model) {
				
				int numPerPage = 10;
				
				List<Map<String, String>> list = co_boardService.coboardSearch(cPage, numPerPage, keyword, searchType);
				
				int count = co_boardService.coboardSearchCount(keyword);
				
				String pageBar = Utils.getPageBar(count, cPage, numPerPage, "boardSearch.do");
				
				System.out.println("list2" + list);
				
				model.addAttribute("keyword", keyword);
				model.addAttribute("searchType", searchType);
				model.addAttribute("list", list);
				model.addAttribute("count", count);
				model.addAttribute("numPerPage", numPerPage);
				model.addAttribute("pageBar", pageBar);
				
				return "board/coListSearch";
				}
		
		
		
}
