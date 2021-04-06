package com.kh.yourfit.mypage.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.cbBoard.model.vo.cbBoard;
import com.kh.yourfit.co_board.model.vo.co_board;
import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.common.util.Utils2;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.mypage.model.service.mypageService;
import com.kh.yourfit.mypage.model.vo.boardCount;
import com.kh.yourfit.mypage.model.vo.dateJoin;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.orders.model.vo.Orders;
import com.kh.yourfit.question.model.vo.Question;
import com.kh.yourfit.mypage.model.vo.sale;

@Controller
public class mypageController {
	
	@Autowired
	mypageService mypageService;
	
	////////////// 회원 마이페이지 - 회원 정보 수정 /////////////////
	
	@RequestMapping("/mypage/memberMypage.do") 
	public String memberMypage(@RequestParam int m_No, Model model) {
		
		Member m = mypageService.memberDetail(m_No);
		
		model.addAttribute("member", m);
		
		return "mypage/member/memberMypage";
	}
	
	@RequestMapping("/mypage/updateMemberView.do") 
	public String updateMemberView(@RequestParam int m_No, Member member, Model model) {
		
		Member m = mypageService.selectOneMember(m_No);
		
		model.addAttribute("member", m);
		
		return "mypage/member/updateMember";
	}
	
	@RequestMapping("/mypage/updateMember.do") 
	public String updateMember(Member member, Model model) {

		int result = mypageService.updateMember(member);
		int m_No = member.getM_No();
		
		String loc="/mypage/memberMypage.do?m_No="+m_No;
		String msg = "";
		
		if( result > 0 ) {
			msg = "회원 정보 수정~!";
		} else {
			msg = "회원 정보 수정 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/mypage/deleteConfirm.do")
	public String deleteConfirm() { // 탈퇴 확인 페이지로 이동
		return "mypage/member/deleteConfirm";
	}
	
	@RequestMapping("/mypage/deleteMember.do")
	public String deleteMember(SessionStatus sessionStatus, Model model, Member member) { // 탈퇴 확인 페이지로 이동
		int result = mypageService.deleteMember(member.getM_No());
		
		if( result > 0 ) sessionStatus.setComplete();
		
		String loc = "/member/Logout.do";
		String msg = "";
		
		if( result > 0 ) msg = "회원 탈퇴 성공!";
		else msg = "회원 탈퇴 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	////////////// 회원 마이페이지 - 작성 글 관리 /////////////////
	
	@RequestMapping("/mypage/selectPostList.do")
	public String selectPostList(@RequestParam int m_No, @RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = mypageService.selectcoBoardList(cPage, numPerPage, m_No);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = mypageService.selectcoBoardTotalContents(m_No);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils2.getPageBar(totalContents, cPage, numPerPage, "selectPostList.do", m_No);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/member/postList";
	}
	
	@ResponseBody
	@RequestMapping("/mypage/deletePost.do")
	public int deletePost(Model model, @RequestParam(value = "arr[]") List<String> arr, co_board coBoard) {
		
		int result = 0;
		
		System.out.println("arr = " + arr);
		
		for(String co_No : arr) {
			coBoard.setCo_No(co_No);
			mypageService.deletePost(co_No);
			result = 1;
		}
		
		return result;
	}
	
	//////////////회원 마이페이지 - 작성 댓글 관리 /////////////////
		
	@RequestMapping("/mypage/selectCommentList.do")
	public String selectCommentList(@RequestParam int m_No, @RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = mypageService.selectCommentList(cPage, numPerPage, m_No);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = mypageService.selectCommentTotalContents(m_No);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils2.getPageBar(totalContents, cPage, numPerPage, "selectCommentList.do", m_No);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/member/commentList";
	}
	
	////////////// 회원 마이페이지 - 상품 문의 관리 /////////////////
	
	@RequestMapping("/mypage/memberQuestionList.do")
	public String memberQuestionList(@RequestParam int m_No, @RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 4; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = mypageService.memberQuestionList(cPage, numPerPage, m_No);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = mypageService.memberQuestionTotalContents(m_No);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils2.getPageBar(totalContents, cPage, numPerPage, "memberQuestionList.do", m_No);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/member/QuestionList";
	}
	
	@ResponseBody
	@RequestMapping("/mypage/deleteQuestion.do")
	public int deleteQuestion(Model model, @RequestParam(value = "arr[]") List<String> arr, Question Question) {
		
		int result = 0;
		
		System.out.println("arr = " + arr);
		
		for(String q_No : arr) {
			Question.setQ_No(Integer.parseInt(q_No));
			mypageService.deleteQuestion(q_No);
			result = 1;
		}
		
		return result;
	}
	
	//////////////회원 마이페이지 - 주문 내역 관리 /////////////////
		
	@RequestMapping("/mypage/memberOrderList.do")
	public String memberOrderList(@RequestParam int m_No, @RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 4; // 한 페이지 당 게시글 and 페이지 수

		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = mypageService.memberOrderList(cPage, numPerPage, m_No);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = mypageService.memberOrderTotalContents(m_No);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils2.getPageBar(totalContents, cPage, numPerPage, "memberOrderList.do", m_No);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/member/memberOrderList";
	}
	////////////// 관리자 페이지 - 회원 관리 /////////////////
	
	@RequestMapping("/mypage/managementMember.do")
	public String managementMember(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) { // 회원 리스트 출력
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = mypageService.selectMember(cPage, numPerPage);
		
		int totalContents = mypageService.selectMemberTotal();
		int totalContentsY = mypageService.selectMemberTotalY();
		int totalContentsN = mypageService.selectMemberTotalN();
		
		int todayJoinMember = mypageService.todayJoinMember();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementMember.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("totalContentsY",totalContentsY);
		model.addAttribute("totalContentsN",totalContentsN);
		model.addAttribute("todayJoinMember",todayJoinMember);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementMember";
	}
	
	@RequestMapping("/mypage/Member.do")
	public String Member(Model model) { 
		
		int womanMember = mypageService.womanMember();
		int manMember = mypageService.manMember();
		int totalMember = mypageService.selectMemberTotal();
		int todayJoinMember = mypageService.todayJoinMember();
		
		model.addAttribute("womanMember",womanMember);
		model.addAttribute("manMember",manMember);
		model.addAttribute("totalMember",totalMember);
		model.addAttribute("todayJoinMember",todayJoinMember);
		
		return "mypage/admin/Member";
	}
	
	@RequestMapping(value = "dataJoinList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String dataJoinList(Locale locale, Model model) {

		Gson gson = new Gson();
		List<dateJoin> list = mypageService.dataJoinList();  ///// 차트용 
		
		return gson.toJson(list);
	}
	
	@RequestMapping("/mypage/managementMemberY.do")
	public String managementMemberY(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) { // 회원 리스트 출력
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = mypageService.selectMemberY(cPage, numPerPage);
		
		int totalContents = mypageService.selectMemberTotal();
		int totalContentsY = mypageService.selectMemberTotalY();
		int totalContentsN = mypageService.selectMemberTotalN();
		
		String pageBar = Utils.getPageBar(totalContentsY, cPage, numPerPage, "managementMember.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("totalContentsY",totalContentsY);
		model.addAttribute("totalContentsN",totalContentsN);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementMemberY";
	}
	
	@RequestMapping("/mypage/managementMemberN.do")
	public String managementMemberN(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) { // 회원 리스트 출력
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = mypageService.selectMemberN(cPage, numPerPage);
		
		int totalContents = mypageService.selectMemberTotal();
		int totalContentsY = mypageService.selectMemberTotalY();
		int totalContentsN = mypageService.selectMemberTotalN();
		
		String pageBar = Utils.getPageBar(totalContentsN, cPage, numPerPage, "managementMember.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("totalContentsY",totalContentsY);
		model.addAttribute("totalContentsN",totalContentsN);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementMemberN";
	}
	
	@RequestMapping("/mypage/memberDetail.do")
	public String memberDetail(@RequestParam int m_No, Member member, Model model) { // 회원 리스트 출력
		
		Member m = mypageService.memberDetail(m_No);
		
		model.addAttribute("member", m);
		
		return "mypage/admin/memberDetail";
		
	}
	
	@RequestMapping("/mypage/suspendMember.do")
	public String suspendMember(@RequestParam int m_No, Member member, Model model) { // 회원 정지여부 수정
		
		Member originSuspension = mypageService.selectOneMember(m_No);
		
		originSuspension.setM_Suspension(member.getM_Suspension());
		
		int result = mypageService.suspendMember(originSuspension);
		
		String loc = "/mypage/managementMember.do";
		String msg = "";
		
		if( result > 0 ) msg = "회원 정지여부 수정 성공!";
		else msg = "회원 정지여부 수정 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	////////////// 관리자 페이지 - 칼로리사전 관리 /////////////////
	
	@RequestMapping("/mypage/managementCB.do")
	public String managementCB(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.managementCB(cPage, numPerPage);
		
		int totalContents = mypageService.selectcbBoard();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementCB.do");
		System.out.println(list);
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementCB";
	}
	
	@RequestMapping("/mypage/cbBoardForm.do")
	public String cbBoardForm(Model model) {
		
		return "mypage/admin/cbBoardForm";
	}
	
	@RequestMapping("/mypage/cbBoardEnd.do")
	public String insertcbBoard(cbBoard cbBoard, Model model) {
		
		int result = mypageService.insertcbBoard(cbBoard);
		
		String loc = "/mypage/managementCB.do";
		String msg = "";
		if( result > 0 ) {
			msg = "칼로리 정보 등록 성공";
		} else {
			msg = "칼로리 정보 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/mypage/cbBoardUpdateView.do")
	public String cbBoardUpdateView(@RequestParam String cb_no, Model model) {
		
		cbBoard cbBoard = mypageService.cbBoardUpdateView(cb_no);
		
		model.addAttribute("cbBoard", cbBoard);
		
		return "mypage/admin/updatecbBoard";
	}
	
	@RequestMapping("/mypage/updateEnd.do")
	public String cbBoardUpdate(cbBoard cbBoard, Model model) {
		
		String cb_no = cbBoard.getCb_no();
		
		// 원본 게시글 불러와 수정하기
		cbBoard origincbBoard = mypageService.cbBoardUpdateView(cb_no);
		// System.out.println("origincbBoard: " + origincbBoard);
		
		origincbBoard.setCb_foodname(cbBoard.getCb_foodname());
		origincbBoard.setCb_unit(cbBoard.getCb_unit());
		origincbBoard.setCb_cal(cbBoard.getCb_cal());
		origincbBoard.setCb_carbohydrate(cbBoard.getCb_carbohydrate());
		origincbBoard.setCb_protein(cbBoard.getCb_protein());
		origincbBoard.setCb_fat(cbBoard.getCb_fat());
		
		int result = mypageService.updatecbBoard(origincbBoard);
		String loc = "/mypage/cbBoardUpdateView.do?cb_no="+cb_no;
		String msg = "";
		
		if( result > 0 ) {
			msg = "칼로리 정보 수정 성공!";
		} else {
			msg = "칼로리 정보 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	@RequestMapping("/mypage/cbBoardDelete.do")
	public String cbBoardDelete(@RequestParam String cb_no, Model model) { // 한개 삭제
		
		int result = mypageService.deletecbBoard(cb_no);
		
		System.out.println(cb_no);
		
		String loc = "/mypage/managementCB.do";
		String msg = "";
		
		if ( result > 0 ) msg = "칼로리 정보 삭제 완료!";
		else msg = "칼로리 정보 삭제 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/mypage/deletecbBoard.do") // 선택 또는 전체 삭제
	public int deletecbBoard(Model model, @RequestParam(value = "arr[]") List<String> arr, cbBoard cbBoard) {
		int result = 0;
		
		for(String cb_no : arr) {
			cbBoard.setCb_no(cb_no);
			mypageService.deletecbBoard(cb_no);
			result = 1;
		}
		
		return result;
	}
	
	//////////////관리자 페이지 - 다이어트 팁 관리 /////////////////
	
	@RequestMapping("/mypage/managementDT.do")
	public String managementDT(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 9;
		
		List<Map<String, String>> list = mypageService.selectdtBoardList(cPage, numPerPage);
		
		int totalContents = mypageService.selectdtBoardTotalContents();
		int totalContentsY = mypageService.selectdtBoardTotalContentsY();
		int totalContentsN = mypageService.selectdtBoardTotalContentsN();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementDT.do");
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("totalContentsY", totalContentsY);
		model.addAttribute("totalContentsN", totalContentsN);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementDT";
	}
	
	@RequestMapping("/mypage/managementDTY.do")
	public String managementDTY(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 9;
		
		List<Map<String, String>> list = mypageService.selectdtBoardListY(cPage, numPerPage);
		
		int totalContents = mypageService.selectdtBoardTotalContentsY();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementDTY.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementDTY";
	}
	
	@RequestMapping("/mypage/managementDTN.do")
	public String managementDTN(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 9;
		
		List<Map<String, String>> list = mypageService.selectdtBoardListN(cPage, numPerPage);
		
		int totalContents = mypageService.selectdtBoardTotalContentsN();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementDTN.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementDTN";
	}
	
	@RequestMapping("/mypage/updateStatus.do")
	public String updateStatus(DtBoard dtboard, Model model) {
		
		int result = mypageService.updateStatus(dtboard);
		
		String loc = "/mypage/managementDT.do";
		String msg = "";
		
		if( result > 0 ) msg = "게시글 정지여부 수정 성공!";
		else msg = "게시글 정지여부 수정 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	//////////////관리자 페이지 - 커뮤니티 관리 /////////////////
		
	@RequestMapping("/mypage/managementCO.do")
	public String managementCO(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 10; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectcoBoardList(cPage, numPerPage);
		
		int totalContents = mypageService.selectcoBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementCO.do");
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementCO";
	}
	
	@RequestMapping("/mypage/managementCOcount.do")
	public String managementCOcount(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 10; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectcoBoardListcount(cPage, numPerPage);
		
		int totalContents = mypageService.selectcoBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementCOcount.do");
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementCOcount";
	}
	
	@RequestMapping("/mypage/managementCOcomment.do")
	public String managementCOcomment(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 10; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectcoBoardListcomment(cPage, numPerPage);
		
		int totalContents = mypageService.selectcoBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementCOcomment.do");
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementCOcomment";
	}
	
	
    //////////////관리자 페이지 - 공지사항 관리 /////////////////
       	
    @RequestMapping("/mypage/managementNotice.do")
    public String managementNotice(
    	@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
    
        int numPerPage = 10; 
        
        List<Map<String, String>> list = mypageService.managementNotice(cPage, numPerPage);
        
        int totalContents = mypageService.selectNotice();
        
        String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementNotice.do");
        		
        model.addAttribute("list", list);
        model.addAttribute("totalContents", totalContents);
        model.addAttribute("numPerPage", numPerPage);
        model.addAttribute("pageBar", pageBar);
        
        return "mypage/admin/managementNotice";
        
        }
        
        @RequestMapping("/mypage/notice_form.do")
        public String noticeForm(Model model) {
        
        return "mypage/admin/notice_form";
    
    }
    
    
    @RequestMapping("/mypage/noticeEnd.do")
    public String insertNotice(Notice notice, Model model) {
        
        int result = mypageService.insertNotice(notice);
        
        String loc = "/mypage/managementNotice.do";
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
    
    
    @RequestMapping("/mypage/notice_updateView.do")
    public String noticeUpdateView(@RequestParam int n_no, Model model) {
    
        Notice notice = mypageService.noticeUpdateView(n_no);
        
        model.addAttribute("notice", notice);
        
        return "mypage/admin/notice_updateView";
    
    }
    
    @RequestMapping("/mypage/update_end.do")
    public String noticeUpdate(Notice notice, Model model) {
        /*
        * int n_no = notice.getN_no();
        */
        int result = mypageService.noticeUpdate(notice);
        
        String loc = "/mypage/managementNotice.do";
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
    
    @RequestMapping("/mypage/notice_delete.do")
    public String noticeDelete(@RequestParam String n_no, Model model) { 
    
        int result = mypageService.noticeDelete(n_no);
        
        System.out.println(n_no);
        
        String loc = "/mypage/managementNotice.do";
        String msg = "";
        
        if ( result > 0 ) msg = "공지사항 삭제 완료!";
        else msg = "공지사항 삭제 실패!";
        
        model.addAttribute("loc", loc);
        model.addAttribute("msg", msg);
        
        return "common/msg";
    
    }
    
    @ResponseBody
    @RequestMapping("/mypage/notice_deleteArr.do") 
    public int noticeDeleteArr(Model model, @RequestParam(value = "arr[]") List<String> arr, Notice notice) {
         int result = 0;
         
         System.out.println("arr = " + arr);
         
         for(String n_no : arr) {
         	notice.setN_no(Integer.parseInt(n_no));
         	mypageService.noticeDelete(n_no);
         	result = 1;
         }
         
         return result;
    }
    
    //////////////////////////// 관리자 - 홈트레이닝 /////////////////////////////////////////////////
    
    @RequestMapping("/mypage/managementHT.do")
	public String htList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 4; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = mypageService.selectHTboardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = mypageService.selectTotalContentsHT();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementHT.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numperPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
	
		return "/mypage/admin/managementHT";
	}
    
    @RequestMapping("/mypage/HomeTraining.do")
	public String HomeTraining(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
    	
		int TotalHomeTraining  = mypageService.selectTotalContentsHT();
		ht_board ht = mypageService.bestHT();
		List<boardCount> list = mypageService.bestHomeTraining();
		
		model.addAttribute("TotalHomeTraining", TotalHomeTraining);
		model.addAttribute("ht", ht);
		model.addAttribute("list", list);
		
		return "mypage/admin/HomeTraining";
	}
    
    @RequestMapping(value = "HomeTrainingCount", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String HomeTrainingCount(Locale locale, Model model) {
    	
		Gson gson = new Gson();
		List<boardCount> list = mypageService.HomeTrainingCount();
		
		return gson.toJson(list);
	}
	
    @RequestMapping(value = "bestHomeTraining", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
   	public @ResponseBody String bestHomeTraining(Locale locale, Model model) {

   		Gson gson = new Gson();
   		List<boardCount> list = mypageService.bestHomeTraining();
   		
   		return gson.toJson(list);
   	}
    
	//////////////관리자 페이지 - 문의 관리 /////////////////////////////////////////
		
	@RequestMapping("/mypage/managementQuestion.do")
	public String managementQeustion(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectQuestionList(cPage, numPerPage);
		
		int totalContents = mypageService.selectQuestionTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementQeustion.do");
				
		model.addAttribute("list", list);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementQ";
	}
	
	@RequestMapping("/mypage/managementPQuestion.do")
	public String managementPQeustion(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectProductQuestionList(cPage, numPerPage);
		
		int totalContents = mypageService.selectProductQuestionTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementPQuestion.do");
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementPQ";
	}
	
	@RequestMapping("/mypage/qna.do")
	public String qna() {
		return "mypage/qna";
	}
	
	@RequestMapping("/mypage/insertAnswer.do")
	public String insertAnswer(@RequestParam int q_No, Question question, Model model) {
		
		int result = mypageService.insertAnswer(question);
		
		System.out.println(question);
		
		// 2. 처리 결과에 따른 화면 분리
		String loc="/mypage/managementPQuestion.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "문의 답변 등록 성공";
			model.addAttribute("question", question);
		} else {
			msg = "문의 답변 등록 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	/////////////////////////////// 관리자 페이지 - 문의 관리 /////////////////////////////////////////
		
	@RequestMapping("/mypage/managementOrders.do")
	public String managementOrders(
	@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 5; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectOrdersList(cPage, numPerPage);
		int totalContents = mypageService.selectOrdersTotalContents();
		int totalContentsY = mypageService.selectOrdersTotalContentsY();
		int totalContentsN = mypageService.selectOrdersTotalContentsN();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementOrders.do");
		
		System.out.println(list);
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("totalContentsY", totalContentsY);
		model.addAttribute("totalContentsN", totalContentsN);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementOrders";
	}
	
	@RequestMapping("/mypage/managementOrdersY.do")
	public String managementOrdersY(
	@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 5; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectOrdersListY(cPage, numPerPage);
		int totalContents = mypageService.selectOrdersTotalContentsY();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementOrders.do");
		
		System.out.println(list);
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementOrdersY";
	}
	
	@RequestMapping("/mypage/managementOrdersN.do")
	public String managementOrdersN(
	@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
	
		int numPerPage = 5; // 한 페이지 당 게시글
		
		List<Map<String, String>> list = mypageService.selectOrdersListN(cPage, numPerPage);
		int totalContents = mypageService.selectOrdersTotalContentsN();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementOrderN.do");
		
		System.out.println(list);
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementOrdersN";
	}
	
	@RequestMapping("/mypage/OrderView.do")
	public String OrderView(@RequestParam int o_No, Model model) {
		
		List<Map<String, String>> list = mypageService.selectOrderViewList(o_No);
		
		model.addAttribute("list", list);
		
		return "mypage/admin/OrderView";
	}
	
	@RequestMapping("/mypage/confirmOrder.do")
	public String confirmOrder(@RequestParam int o_No, Model model) {
	
		int result = mypageService.updateOrder(o_No);
		
		String loc="/mypage/managementOrdersN.do";
		String msg = "";
		
		if( result > 0 ) msg = "주문 접수 성공";
		else msg = "주문 접수 실패";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/mypage/sale.do")
	public String sale(Model model) {  /////////// 모든 기준은 1월로 세팅되어있음 2021-01-01 ~ 2021-01-31
		
		int yesterdaySale = mypageService.yesterdaySale();
		int todaySale = mypageService.todaySale();
		int monthSale = mypageService.monthSale();
		int yesterdayOrders = mypageService.yesterdayOrders();
		int todayOrders = mypageService.todayOrders();
		
		int weekendSaleSum = mypageService.weekendSaleSum();
		int previousweekendSum = mypageService.previousweekendSum();
		
		int livingSale = mypageService.livingSale();
		int foodSale = mypageService.foodSale();
		int beautySale = mypageService.beautySale();
		
		List<Orders> list = mypageService.selectBestProduct();	
		
		int womanOrders = mypageService.womanOrders(); 
		int manOrders = mypageService.manOrders();
		int allOrders = mypageService.allOrders();
		
		model.addAttribute("yesterdaySale", yesterdaySale);
		model.addAttribute("todaySale", todaySale);
		model.addAttribute("monthSale", monthSale);
		model.addAttribute("yesterdayOrders", yesterdayOrders);
		model.addAttribute("todayOrders", todayOrders);
		model.addAttribute("weekendSaleSum", weekendSaleSum);
		model.addAttribute("previousweekendSum", previousweekendSum);
		model.addAttribute("livingSale", livingSale);
		model.addAttribute("foodSale", foodSale);
		model.addAttribute("beautySale", beautySale);
		model.addAttribute("list", list);
		model.addAttribute("womanOrders", womanOrders);
		model.addAttribute("manOrders", manOrders);
		model.addAttribute("allOrders", allOrders);
		
		return "mypage/admin/sale";
	} 
	
	@RequestMapping(value = "weekendSale", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String weekendSale(Locale locale, Model model) {
    	
		Gson gson = new Gson();
		List<sale> list = mypageService.weekendSale(); // 리스트 ( 차트용 )
		
		return gson.toJson(list);
	}
	
	@RequestMapping(value = "previousweekendSale", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String previousweekendSale(Locale locale, Model model) {
    	
		Gson gson = new Gson();
		List<sale> list = mypageService.previousweekendSale(); // 리스트 ( 차트용 )
		
		return gson.toJson(list);
	}
	

	@RequestMapping("/mypage/managementAD.do")
	public String managementAD(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 6;
		
		List<Map<String, String>> list = mypageService.selectadBoardList(cPage, numPerPage);
		
		System.out.println(list);
		int totalContents = mypageService.selectadBoardTotalContents();
		int totalContentsY = mypageService.selectadBoardTotalContentsY();
		int totalContentsN = mypageService.selectadBoardTotalContentsN();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementAD.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("totalContentsY", totalContentsY);
		model.addAttribute("totalContentsN", totalContentsN);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementAD";
	}
	
	@RequestMapping("/mypage/managementADY.do")
	public String managementADY(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 6;
		
		List<Map<String, String>> list = mypageService.selectadBoardListY(cPage, numPerPage);
		
		int totalContents = mypageService.selectadBoardTotalContentsY();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementADY.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementADY";
	}
	
	@RequestMapping("/mypage/managementADN.do")
	public String managementADN(
		@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 6;
		
		List<Map<String, String>> list = mypageService.selectadBoardListN(cPage, numPerPage);
		
		int totalContents = mypageService.selectadBoardTotalContentsN();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "managementADN.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/admin/managementADN";
	}
	
	@RequestMapping("/mypage/adupdateStatus.do")
	public String updateStatus(AdBoard adboard, Model model) {
		
		int result = mypageService.adupdateStatus(adboard);
		
		String loc = "/mypage/managementAD.do";
		String msg = "";
		
		if( result > 0 ) msg = "광고 비활성화 성공!";
		else msg = "광고 비활성화 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	//////////////관리자 페이지 - 광고 등록 /////////////////////////////////////////
	@RequestMapping("/mypage/adBoardForm.do")
	public String adBoardForm() {
	return "mypage/admin/adBoardForm";
}
		
}
		