package com.kh.yourfit.index_list.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.index_list.model.service.IndexService;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

@Controller
public class Index_Controller {
	
	@Autowired
	IndexService indexService;
	
	
	/*index 공지사항 목록*/
	@RequestMapping("/index.do")
	public String selectNoticeListIndex(@RequestParam(value= "cPage",
	                                required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = indexService.selectNoticeList(cPage, numPerPage);
		List<Member> mlist = indexService.selectMemberList();
		List<DtBoard> dlist = indexService.selectDTList();
		List<ht_board> hlist = indexService.selectHTList();
		List<Map<Product, product_img>> plist = indexService.selectProductList();
		List<Map<String, String>> adlist = indexService.selectadBoardList();
		
		int totalContents = indexService.selectNoticeTotalContents();
		
		 String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "notice_list.do");
		    
		    System.out.println("list : " + list);
		    
		    model.addAttribute("adlist", adlist);
		    model.addAttribute("dlist", dlist);
		    model.addAttribute("hlist", hlist);
		    model.addAttribute("mlist", mlist);
		    model.addAttribute("plist", plist);
		    model.addAttribute("list", list);
		    model.addAttribute("totalContents", totalContents);
		    model.addAttribute("numPerPage", numPerPage);
		    model.addAttribute("pageBar", pageBar);
		    
			return "/index";
	}
	
	 @RequestMapping("/indexupdate.do")
	    public String noticeUpdateViewIndex(@RequestParam int n_no, Model model) {
	    
	        Notice notice = indexService.noticeUpdateView(n_no);
	        
	        model.addAttribute("notice", notice);
	        
	        return "/index";
	    
	    }
	 /*index 공지사항 목록 끝*/
	
}