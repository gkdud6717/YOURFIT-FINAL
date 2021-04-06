package com.kh.yourfit.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.notice.model.service.NoticeService;
import com.kh.yourfit.notice.model.vo.Notice;

@Controller
public class Notice_Controller {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/notice/notice_list.do")
	public String selectNoticeList(@RequestParam(value= "cPage",
	                                required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = noticeService.selectNoticeList(cPage, numPerPage);
		
		int totalContents = noticeService.selectNoticeTotalContents();
		
		 String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "notice_list.do");
		    
		    System.out.println("list : " + list);
		    
		    model.addAttribute("list", list);
		    model.addAttribute("totalContents", totalContents);
		    model.addAttribute("numPerPage", numPerPage);
		    model.addAttribute("pageBar", pageBar);
		    
			return "notice/notice_list";
	}
	
	
	@RequestMapping("/notice/notice_detail.do")
	public String noticeDetail(@RequestParam(value = "n_no", required = true, defaultValue="1") int n_no, Model model) {
		
		Notice notice = noticeService.selectOneNotice(n_no);
		
		model.addAttribute("notice", notice);
		
		return "notice/notice_detail";
	}
	
	      
	        @RequestMapping("/notice/notice_form.do")
	        public String noticeForm(Model model) {
	        
	        return "notice/notice_form";
	    
	    }
	    
	    
	    @RequestMapping("/notice/noticeEnd.do")
	    public String insertNotice(Notice notice, Model model) {
	        
	        int result = noticeService.insertNotice(notice);
	        
	        String loc = "/notice/notice_list.do";
	        String msg = "";
	        if( result > 0 ) {
	        	msg = "공지사항 정보 등록 성공";
	        } else {
	        	msg = "공지사항 정보 등록 실패!";
	        }
	        
	        model.addAttribute("loc", loc);
	        model.addAttribute("msg", msg);
	        
	        return "common/msg";
	    
	    }
	    
	    
	    @RequestMapping("/notice/notice_updateView.do")
	    public String noticeUpdateView(@RequestParam int n_no, Model model) {
	    
	        Notice notice = noticeService.noticeUpdateView(n_no);
	        
	        model.addAttribute("notice", notice);
	        
	        return "notice/notice_updateView";
	    
	    }
	    
	    @RequestMapping("/notice/update_end.do")
	    public String noticeUpdate(Notice notice, Model model) {
	        /*
	        * int n_no = notice.getN_no();
	        */
	        int result = noticeService.noticeUpdate(notice);
	        
	        String loc = "/notice/notice_list.do";
	        String msg = "";
	        System.out.println("result : " + result);
	        if( result > 0 ) {
	        	msg = "공지사항 수정 성공!";
	        } else {
	        	msg = "공지사항 수정 실패!";
	        }
	        
	        model.addAttribute("loc", loc);
	        model.addAttribute("msg", msg);
	        
	        return "common/msg";
	    
	    }
	    
	    @RequestMapping("/notice/notice_search.do")
		public String NoticeSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
                @RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
                @RequestParam(value="searchType", required=false, defaultValue="title") String searchType, Model model) {
				
				int numPerPage = 10;
				
				List<Map<String, String>> list = noticeService.noticeSearch(cPage, numPerPage, keyword, searchType);
				
				int count = noticeService.noticeSearchCount(keyword);
				
				String pageBar = Utils.getPageBar(count, cPage, numPerPage, "notice_search.do");
				
				System.out.println("list2" + list);
				
				model.addAttribute("keyword", keyword);
				model.addAttribute("searchType", searchType);
				model.addAttribute("list", list);
				model.addAttribute("count", count);
				model.addAttribute("numPerPage", numPerPage);
				model.addAttribute("pageBar", pageBar);
				
				return "notice/notice_search";
			}
	    

}
