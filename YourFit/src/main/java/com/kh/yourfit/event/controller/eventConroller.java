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
		
			// 1. ?????? ?????? ????????? ?????? ????????? ?????? ?????? ??????
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
					
						// 3. list??? ??????
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
					msg = "????????? ?????? ??????";
				} else {
					msg = "????????? ?????? ??????!";
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
		
		// 1. ?????? ?????? ?????? ??????   
				String saveDirectory = req.getServletContext().getRealPath("/resources/eventUpload");
					
				// ?????? ???????????? ??????
				List<board_file> boardfileList = eventService.selectEventFileList(e_No);
			
				if( boardfileList == null ) boardfileList = new ArrayList<board_file>();
				// System.out.println("??????1 : " + boardfileList);
				// 2. ????????? ?????? ?????? ????????? ??????!
				int idx = 0;
				for(MultipartFile f : upFiles) {
					board_file bf = null;
						
						if( f.isEmpty() == false ) {
							
							System.out.println("?????? ????????? ?????? : " + f);
							System.out.println("?????? ????????? ??? ?????? : " + saveDirectory +"/" + boardfileList.get(idx).getF_Cname());
							// ?????? ?????? ??????
							if( boardfileList.size() > idx) {
								boolean fileDelete
								   = new File(saveDirectory +"/" + boardfileList.get(idx).getF_Cname()).delete();
								
								System.out.println("?????? ?????? ?????? ?????? : " + fileDelete);
								
								bf = boardfileList.get(idx);
							} else {
								bf = new board_file();
								bf.setE_No(e_No);;
								
								boardfileList.add(bf);
								
							}
							
							// ?????? ?????? ????????????
							String originName = f.getOriginalFilename();
							String changeName = fileNameChanger(originName);
							
							// ?????? ?????? ??????
							try {
								f.transferTo(new File(saveDirectory + "/" + changeName));
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
								
							}
							
							//System.out.println("??????2 : " + boardfileList);
							
							bf.setF_Name(originName);
							bf.setF_Cname(changeName);
							
							boardfileList.set(idx, bf);
							
							//System.out.println("??????3 : " + boardfileList);
							
						}
						idx++;	
					}
					
					// 3. update ????????? ??????
					int result = eventService.updateEvent(originEvent, boardfileList);
					String loc = "/event/eventList.do";
					String msg = "";
					
					if( result > 0 ) {
						msg = "????????? ?????? ??????!";
					} else {
						msg = "????????? ?????? ??????!";
					}
					
					model.addAttribute("loc", loc);
					model.addAttribute("msg", msg);
			
			return "common/msg";
		}
	
	@RequestMapping("/event/deleteEvent.do")
	public String deleteEvent(@RequestParam int e_No, HttpServletRequest req, Model model) {
		
		// 1. ????????? ????????? ?????? ??????
			String saveDir = req.getServletContext().getRealPath("/resources/eventUpload");
				
			// ???????????? ?????? ??????
			List<board_file> delList = eventService.selectEventFileList(e_No);
				
			// 2. DB ?????? ????????????
			int result = eventService.deleteEvent(e_No);
				
			String loc = "/event/eventList.do";
			String msg = "";
				
			if ( result > 0 ) {
					msg = "????????? ?????? ??????!";
					
					// 3. ?????? ?????? ?????????
					for(board_file bf : delList) {
						new File(saveDir + "/" + bf.getF_Cname()).delete();
					}
					
				} else {
					msg = "????????? ?????? ??????!";
				}
				
				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);
				
				return "common/msg";
	}

}
