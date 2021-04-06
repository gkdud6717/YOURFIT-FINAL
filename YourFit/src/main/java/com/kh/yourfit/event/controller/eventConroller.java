package com.kh.yourfit.event.controller;

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

import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.event.model.service.eventService;
import com.kh.yourfit.event.model.vo.event;

@Controller
public class eventConroller {
	
	@Autowired
	eventService eventService;
	
	@RequestMapping("/event/eventList.do")
	public String selctEventList(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 3;
    	
		List<Map<String, String>> list = eventService.selectEventList(cPage, numPerPage);
		
		int totalContents = eventService.selectTotalContentsEvent();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "eventList.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "event/eventList";
	}
	
	@RequestMapping("/event/eventView.do")
	public String selctEventOne(@RequestParam int e_No, Model model) {
    	
		event event = eventService.selctEventOne(e_No);
		List<board_file> board_file = eventService.selectEventFileList(e_No);
		
		model.addAttribute("event", event);
		model.addAttribute("board_file", board_file);
		
		return "event/eventView";
	}
	
	@RequestMapping("/event/eventSearch.do")
	public String eventSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
				            @RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
				            @RequestParam(value="searchType", required=false, defaultValue="title") String searchType, Model model) {
		int numPerPage = 3;
    	
		List<Map<String, String>> list = eventService.eventSearch(cPage, numPerPage, keyword, searchType);
		
		int totalContents = eventService.selectTotalSearchEvent(keyword);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "eventSearch.do");
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchType", searchType);
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "event/eventSearch";
	}
	
	@RequestMapping("/event/insertEventForm.do")
	public String insertEventForm() {
		return "/event/insertEventForm";
	}
	
	@RequestMapping("/event/insertEvent.do")
	public String insertEvent(event event, Model model, HttpServletRequest req,
			@RequestParam(value="upfiles", required=false) MultipartFile[] upfiles) {
		
			// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
				String saveDirectory
				      = req.getServletContext().getRealPath("/resources/eventUpload");
				
				List<board_file> fileList = new ArrayList<board_file>();
				
				for(MultipartFile f : upfiles) {
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
				
				int result = eventService.insertEvent(event, fileList);
				
				String loc = "/event/eventList.do";
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
	
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}
	
	@RequestMapping("/event/updateEventView.do")
	public String updateEventForm(@RequestParam int e_No, Model model) {
	    	
			event event = eventService.selctEventOne(e_No);
			List<board_file> board_file = eventService.selectEventFileList(e_No);
			
			model.addAttribute("event", event);
			model.addAttribute("board_file", board_file);
			
		return "/event/updateEventForm";
	}
	
	@RequestMapping("/event/updateEvent.do")
	public String eventUpdate(event event,
							  @RequestParam(value="upfiles", required=false) MultipartFile[] upFiles,
							  HttpServletRequest req, Model model) {
	
		int e_No = event.getE_No();
		
		event originEvent = eventService.selctEventOne(e_No); 
		
		originEvent.setE_Title(event.getE_Title());
		originEvent.setE_Content(event.getE_Content());
		originEvent.setE_Start(event.getE_Start());
		originEvent.setE_End(event.getE_End());
		
		// 1. 파일 저장 경로 선언   
				String saveDirectory = req.getServletContext().getRealPath("/resources/eventUpload");
					
				// 원본 첨부파일 목록
				List<board_file> boardfileList = eventService.selectEventFileList(e_No);
			
				if( boardfileList == null ) boardfileList = new ArrayList<board_file>();
				// System.out.println("결과1 : " + boardfileList);
				// 2. 변경한 파일 정보 업로드 시작!
				int idx = 0;
				for(MultipartFile f : upFiles) {
					board_file bf = null;
						
						if( f.isEmpty() == false ) {
							
							System.out.println("새로 들어온 파일 : " + f);
							System.out.println("삭제 되어야 할 파일 : " + saveDirectory +"/" + boardfileList.get(idx).getF_Cname());
							// 원본 파일 삭제
							if( boardfileList.size() > idx) {
								boolean fileDelete
								   = new File(saveDirectory +"/" + boardfileList.get(idx).getF_Cname()).delete();
								
								System.out.println("파일 삭제 여부 확인 : " + fileDelete);
								
								bf = boardfileList.get(idx);
							} else {
								bf = new board_file();
								bf.setE_No(e_No);;
								
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
					int result = eventService.updateEvent(originEvent, boardfileList);
					String loc = "/event/eventList.do";
					String msg = "";
					
					if( result > 0 ) {
						msg = "게시글 수정 성공!";
					} else {
						msg = "게시글 수정 실패!";
					}
					
					model.addAttribute("loc", loc);
					model.addAttribute("msg", msg);
			
			return "common/msg";
		}
	
	@RequestMapping("/event/deleteEvent.do")
	public String deleteEvent(@RequestParam int e_No, HttpServletRequest req, Model model) {
		
		// 1. 파일이 저장된 폴더 경로
			String saveDir = req.getServletContext().getRealPath("/resources/eventUpload");
				
			// 첨부파일 삭제 명단
			List<board_file> delList = eventService.selectEventFileList(e_No);
				
			// 2. DB 정보 삭제하기
			int result = eventService.deleteEvent(e_No);
				
			String loc = "/event/eventList.do";
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

}
