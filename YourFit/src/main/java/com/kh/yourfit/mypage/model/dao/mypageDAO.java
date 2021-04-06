package com.kh.yourfit.mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.cbBoard.model.vo.cbBoard;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.mypage.model.vo.boardCount;
import com.kh.yourfit.mypage.model.vo.dateJoin;
import com.kh.yourfit.mypage.model.vo.sale;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.orders.model.vo.Orders;
import com.kh.yourfit.question.model.vo.Question;

public interface mypageDAO {
	
	int deleteMember(int m_No);

	List<Map<String, String>> selectMember(int cPage, int numPerPage);
	List<Map<String, String>> selectMemberY(int cPage, int numPerPage);
	List<Map<String, String>> selectMemberN(int cPage, int numPerPage);
	
	int selectMemberTotal();
	int selectMemberTotalY();
	int selectMemberTotalN();
	int todayJoinMember();

	Member selectOneMember(int m_No);

	List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage, int m_No);

	int selectcoBoardTotalContents(int m_No);

	int suspendMember(Member origincSuspension);

	int selectcbBoard();

	List<Map<String, String>> managementCB(int cPage, int numPerPage);
	
	int insertcbBoard(cbBoard cbBoard);

	int deletecbBoard(String cb_no);

	int updatecbBoard(cbBoard cbBoard);

	cbBoard selectOnecbBoard(String cb_no);

	int updateMember(Member member);

	List<Map<String, String>> selectdtBoardList(int cPage, int numPerPage);
	int selectdtBoardTotalContents();
	
	List<Map<String, String>> selectdtBoardListY(int cPage, int numPerPage);
	int selectdtBoardTotalContentsY();
	
	List<Map<String, String>> selectdtBoardListN(int cPage, int numPerPage);
	int selectdtBoardTotalContentsN();

	int deletePost(String co_No);

	List<Map<String, String>> selectCommentList(int cPage, int numPerPage, int m_No);

	int selectCommentTotalContents(int m_No);

	List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage);
	List<Map<String, String>> selectcoBoardListcount(int cPage, int numPerPage);
	List<Map<String, String>> selectcoBoardListcomment(int cPage, int numPerPage);

	int selectcoBoardTotalContents();

	int updateStatus(DtBoard dtboard);

	Member memberDetail(int m_No);
	
	List<Map<String, String>> managementNotice(int cPage, int numPerPage);

	int selectNotice();

	int insertNotice(Notice notice);

	Notice noticeUpdateView(int n_no);

	int noticeUpdate(Notice notice);

	int noticeDelete(String n_no);

	List<Map<String, String>> selectHTboardList(int cPage, int numPerPage);
	int selectTotalContentsHT();

	int womanMember();
	int manMember();

	List<dateJoin> dataJoinList();

	List<Map<String, String>> selectQuestionList(int cPage, int numPerPage);
	List<Map<String, String>> selectProductQuestionList(int cPage, int numPerPage);

	int selectQuestionTotalContents();

	List<boardCount> HomeTrainingCount();

	ht_board bestHT();

	List<boardCount> bestHomeTraining();

	int selectProductQuestionTotalContents();

	int insertAnswer(Question question);

	List<Map<String, String>> memberQuestionList(int cPage, int numPerPage, int m_No);

	int memberQuestionTotalContents(int m_No);

	List<Map<String, String>> memberOrderList(int cPage, int numPerPage, int m_No);

	int memberOrderTotalContents(int m_No);

	int deleteQuestion(String q_No);

	List<Map<String, String>> selectOrdersList(int cPage, int numPerPage);
	List<Map<String, String>> selectOrdersListY(int cPage, int numPerPage);
	List<Map<String, String>> selectOrdersListN(int cPage, int numPerPage);

	int selectOrdersTotalContents();
	int selectOrdersTotalContentsY();
	int selectOrdersTotalContentsN();

	List<Map<String, String>> selectOrderViewList(int o_No);

	int updateOrder(int o_No);

	int yesterdaySale();
	int todaySale();
	int monthSale();
	int yesterdayOrders();
	int todayOrders();
	
	int livingSale();
	int foodSale();
	int beautySale();

	int weekendSaleSum();
	int previousweekendSum();
	
	List<sale> weekendSale();
	List<sale> previousweekendSale();

	List<Orders> selectBestProduct();

	int womanOrders();
	int manOrders();
	int allOrders();

	List<Map<String, String>> selectadBoardList(int cPage, int numPerPage);

	int selectadBoardTotalContents();

	int selectadBoardTotalContentsY();

	int selectadBoardTotalContentsN();

	List<Map<String, String>> selectadBoardListY(int cPage, int numPerPage);

	List<Map<String, String>> selectadBoardListN(int cPage, int numPerPage);

	int adupdateStatus(AdBoard adboard);



	

}
