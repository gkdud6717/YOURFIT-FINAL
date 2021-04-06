package com.kh.yourfit.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.cbBoard.model.vo.cbBoard;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.mypage.model.dao.mypageDAO;
import com.kh.yourfit.mypage.model.vo.boardCount;
import com.kh.yourfit.mypage.model.vo.dateJoin;
import com.kh.yourfit.mypage.model.vo.sale;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.orders.model.vo.Orders;
import com.kh.yourfit.question.model.vo.Question;

@Service
public class mypageServiceImpl implements mypageService {

	@Autowired
	mypageDAO mypageDAO;
	
	//////////////// 회원
	
	@Override
	public int updateMember(Member member) {
		int totalResult = 0;
		totalResult =  mypageDAO.updateMember(member);
		return totalResult;
	}

	@Override
	public int deleteMember(int m_No) {	
		return mypageDAO.deleteMember(m_No);
	}

	@Override
	public List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage, int m_No) {
		return mypageDAO.selectcoBoardList(cPage, numPerPage, m_No);
	}

	@Override
	public int selectcoBoardTotalContents(int m_No) {
		return mypageDAO.selectcoBoardTotalContents(m_No);
	}
	
	@Override
	public int deletePost(String co_No) {
		return  mypageDAO.deletePost(co_No);
	}

	@Override
	public List<Map<String, String>> selectCommentList(int cPage, int numPerPage, int m_No) {
		return mypageDAO.selectCommentList(cPage, numPerPage, m_No);
	}

	@Override
	public int selectCommentTotalContents(int m_No) {
		return mypageDAO.selectCommentTotalContents(m_No);
	}
	
	@Override
	public List<Map<String, String>> memberQuestionList(int cPage, int numPerPage, int m_No) {
		return mypageDAO.memberQuestionList(cPage, numPerPage, m_No);
	}

	@Override
	public int memberQuestionTotalContents(int m_No) {
		return mypageDAO.memberQuestionTotalContents(m_No);
	}

	@Override
	public List<Map<String, String>> memberOrderList(int cPage, int numPerPage, int m_No) {
		return mypageDAO.memberOrderList(cPage, numPerPage, m_No);
	}

	@Override
	public int memberOrderTotalContents(int m_No) {
		return mypageDAO.memberOrderTotalContents(m_No);
	}
	

	@Override
	public int deleteQuestion(String q_No) {
		return mypageDAO.deleteQuestion(q_No);
	}

	
	/////////////////////////////////////////// 관리자
	
	@Override
	public List<Map<String, String>> selectMember(int cPage, int numPerPage) {
		return mypageDAO.selectMember(cPage, numPerPage);
	}
	@Override
	public List<Map<String, String>> selectMemberY(int cPage, int numPerPage) {
		return mypageDAO.selectMemberY(cPage, numPerPage);
	}
	@Override
	public List<Map<String, String>> selectMemberN(int cPage, int numPerPage) {
		return mypageDAO.selectMemberN(cPage, numPerPage);
	}
	
	@Override
	public int selectMemberTotal() { return mypageDAO.selectMemberTotal();	}
	@Override
	public int selectMemberTotalY() { return mypageDAO.selectMemberTotalY();	}
	@Override
	public int selectMemberTotalN() { return mypageDAO.selectMemberTotalN();	}
	@Override
	public int todayJoinMember() { return mypageDAO.todayJoinMember();	}
	
	@Override
	public Member selectOneMember(int m_No) {
		return mypageDAO.selectOneMember(m_No);
	}

	@Override
	public int suspendMember(Member origincSuspension) {
		int totalResult = 0;
		totalResult = mypageDAO.suspendMember(origincSuspension);
		return totalResult;
	}

	@Override
	public int selectcbBoard() {	
		return mypageDAO.selectcbBoard();
	}

	@Override
	public List<Map<String, String>> managementCB(int cPage, int numPerPage) {
		return mypageDAO.managementCB(cPage, numPerPage);
	}
	
	@Override
	public int insertcbBoard(cbBoard cbBoard) {
		return mypageDAO.insertcbBoard(cbBoard);
	}
	
	@Override
	public cbBoard cbBoardUpdateView(String cb_no) {
		return mypageDAO.selectOnecbBoard(cb_no);
	}
	
	@Override
	public int updatecbBoard(cbBoard cbBoard) {	
		int totalResult = 0;
		totalResult = mypageDAO.updatecbBoard(cbBoard);
		return totalResult;
	}

	@Override
	public int deletecbBoard(String cb_no) {	
		return mypageDAO.deletecbBoard(cb_no);
	}

	@Override
	public List<Map<String, String>> selectdtBoardList(int cPage, int numPerPage) {
		return mypageDAO.selectdtBoardList(cPage, numPerPage);
	}
	@Override
	public int selectdtBoardTotalContents() {		
		return mypageDAO.selectdtBoardTotalContents();
	}
	
	@Override
	public List<Map<String, String>> selectdtBoardListY(int cPage, int numPerPage) {
		return mypageDAO.selectdtBoardListY(cPage, numPerPage);
	}
	@Override
	public int selectdtBoardTotalContentsY() {		
		return mypageDAO.selectdtBoardTotalContentsY();
	}
	
	@Override
	public List<Map<String, String>> selectdtBoardListN(int cPage, int numPerPage) {
		return mypageDAO.selectdtBoardListN(cPage, numPerPage);
	}
	@Override
	public int selectdtBoardTotalContentsN() {		
		return mypageDAO.selectdtBoardTotalContentsN();
	}

	@Override
	public List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage) { return mypageDAO.selectcoBoardList(cPage, numPerPage); }
	@Override
	public List<Map<String, String>> selectcoBoardListcount(int cPage, int numPerPage) { return mypageDAO.selectcoBoardListcount(cPage, numPerPage);	}
	@Override
	public List<Map<String, String>> selectcoBoardListcomment(int cPage, int numPerPage) { return mypageDAO.selectcoBoardListcomment(cPage, numPerPage); }

	@Override
	public int selectcoBoardTotalContents() { return mypageDAO.selectcoBoardTotalContents(); }
	
	@Override
	public int updateStatus(DtBoard dtboard) {
		int totalResult = 0;
		totalResult = mypageDAO.updateStatus(dtboard);
		return totalResult;
	}

	@Override
	public Member memberDetail(int m_No) {
		return mypageDAO.memberDetail(m_No);
	}
	
    //////////////공지사항
    
    @Override
    public List<Map<String, String>> managementNotice(int cPage, int numPerPage) {
    
        return mypageDAO.managementNotice(cPage, numPerPage);
    }
    
    @Override
    public int selectNotice() {
     
        return mypageDAO.selectNotice();
    }
    
    @Override
    public int insertNotice(Notice notice) {
    
        return  mypageDAO.insertNotice(notice);
    }
    
    @Override
    public Notice noticeUpdateView(int n_no) {
    
        return  mypageDAO.noticeUpdateView(n_no);
    }
    
    @Override
    public int noticeUpdate(Notice notice) {
    
        int totalResult = 0;
        
        totalResult = mypageDAO.noticeUpdate(notice);
        
        return totalResult;
    }
    /*
    
    @Override
    public int noticeDelete(int n_no) {
    
    return mypageDAO.noticeDelete(n_no);
    }
    */
    
    @Override
    public int noticeDelete(String n_no) {
    
        return mypageDAO.noticeDelete(n_no);
    }

	@Override
	public List<Map<String, String>> selectHTboardList(int cPage, int numPerPage) {
		return mypageDAO.selectHTboardList(cPage, numPerPage);
	}

	@Override
	public int selectTotalContentsHT() {
		return mypageDAO.selectTotalContentsHT();
	}

	@Override
	public int womanMember() { return mypageDAO.womanMember();	}
	@Override
	public int manMember() {return mypageDAO.manMember();	}

	@Override
	public List<dateJoin> dataJoinList() {
		return mypageDAO.dataJoinList();
	}

	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage) {
		return mypageDAO.selectQuestionList(cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectProductQuestionList(int cPage, int numPerPage) {
		return mypageDAO.selectProductQuestionList(cPage, numPerPage);
	}

	@Override
	public int selectQuestionTotalContents() {
		return mypageDAO.selectQuestionTotalContents();
	}
	@Override
	public int selectProductQuestionTotalContents() {
		return mypageDAO.selectProductQuestionTotalContents();
	}

	@Override
	public List<boardCount> HomeTrainingCount() {
		return mypageDAO.HomeTrainingCount();
	}

	@Override
	public ht_board bestHT() {
		return mypageDAO.bestHT();
	}

	@Override
	public List<boardCount> bestHomeTraining() {
		return mypageDAO.bestHomeTraining();
	}

	@Override
	public int insertAnswer(Question question) {
		return mypageDAO.insertAnswer(question);
	}
	
	
	
	/////////////////// 관리자 주문관리
	
	@Override
	public List<Map<String, String>> selectOrdersList(int cPage, int numPerPage) { return mypageDAO.selectOrdersList(cPage, numPerPage); }
	@Override
	public List<Map<String, String>> selectOrdersListY(int cPage, int numPerPage) { return mypageDAO.selectOrdersListY(cPage, numPerPage); }
	@Override
	public List<Map<String, String>> selectOrdersListN(int cPage, int numPerPage) { return mypageDAO.selectOrdersListN(cPage, numPerPage); }
	
	@Override
	public int selectOrdersTotalContents() { return mypageDAO.selectOrdersTotalContents(); }
	@Override
	public int selectOrdersTotalContentsY() { return mypageDAO.selectOrdersTotalContentsY(); }
	@Override
	public int selectOrdersTotalContentsN() { return mypageDAO.selectOrdersTotalContentsN(); }

	@Override
	public List<Map<String, String>> selectOrderViewList(int o_No) {
		return mypageDAO.selectOrderViewList(o_No);
	}

	@Override
	public int updateOrder(int o_No) {
		int totalResult = 0;
		totalResult = mypageDAO.updateOrder(o_No);
		return totalResult;
	}
	
	@Override
	public int yesterdaySale() { return mypageDAO.yesterdaySale();	}
	@Override
	public int todaySale() { return mypageDAO.todaySale();	}
	@Override
	public int monthSale() { return mypageDAO.monthSale();	}
	@Override
	public int yesterdayOrders() { return mypageDAO.yesterdayOrders();	}
	@Override
	public int todayOrders() { return mypageDAO.todayOrders();	}
	@Override
	public int livingSale() { return mypageDAO.livingSale(); }
	@Override
	public int foodSale() { return mypageDAO.foodSale(); }
	@Override
	public int beautySale() { return mypageDAO.beautySale(); }
	
	
	@Override
	public int weekendSaleSum() { return mypageDAO.weekendSaleSum();	}
	@Override
	public int previousweekendSum() { return mypageDAO.previousweekendSum();	}
	
	@Override
	public List<sale> weekendSale() { return mypageDAO.weekendSale(); }
	@Override
	public List<sale> previousweekendSale() { return mypageDAO.previousweekendSale(); }
	
	@Override
	public List<Orders> selectBestProduct() { return mypageDAO.selectBestProduct(); }
	
	@Override
	public int womanOrders() { return mypageDAO.womanOrders(); }
	@Override
	public int manOrders() { return mypageDAO.manOrders(); }
	@Override
	public int allOrders() { return mypageDAO.allOrders(); }

	@Override
	public List<Map<String, String>> selectadBoardList(int cPage, int numPerPage) {
		return mypageDAO.selectadBoardList(cPage, numPerPage);
	}

	@Override
	public int selectadBoardTotalContents() {
		return mypageDAO.selectadBoardTotalContents();
	}

	@Override
	public int selectadBoardTotalContentsY() {
		return mypageDAO.selectadBoardTotalContentsY();
	}

	@Override
	public int selectadBoardTotalContentsN() {
		return mypageDAO.selectadBoardTotalContentsN();
	}

	@Override
	public List<Map<String, String>> selectadBoardListY(int cPage, int numPerPage) {
		return mypageDAO.selectadBoardListY(cPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> selectadBoardListN(int cPage, int numPerPage) {
		return mypageDAO.selectadBoardListN(cPage,numPerPage);
	}

	@Override
	public int adupdateStatus(AdBoard adboard) {
		return mypageDAO.adupdateStatus(adboard);
	}


	
}
