package com.kh.yourfit.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class mypageDAOImpl implements mypageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//////////// 회원 

	@Override
	public int deleteMember(int m_No) {
		return sqlSession.delete("mypage.deleteMember", m_No);
	}
	
	@Override
	public int updateMember(Member member) {
		return sqlSession.update("mypage.updateMember", member);
	}
	
	@Override
	public List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage, int m_No) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectcoBoardList", m_No, rows);
	}

	@Override
	public int selectcoBoardTotalContents(int m_No) {
		return sqlSession.selectOne("mypage.selectcoBoardTotalContents", m_No);
	}

	@Override
	public int deletePost(String co_No) {
		return sqlSession.delete("mypage.deletePost", co_No);
	}
	
	@Override
	public List<Map<String, String>> selectCommentList(int cPage, int numPerPage, int m_No) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectCommentList", m_No, rows);
	}

	@Override
	public int selectCommentTotalContents(int m_No) {
		return sqlSession.selectOne("mypage.selectCommentTotalContents", m_No);
	}
	
	@Override
	public List<Map<String, String>> memberQuestionList(int cPage, int numPerPage, int m_No) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.memberQuestionList", m_No, rows); 
	}

	@Override
	public int memberQuestionTotalContents(int m_No) {
		return sqlSession.selectOne("mypage.memberQuestionTotalContents", m_No);
	}

	@Override
	public List<Map<String, String>> memberOrderList(int cPage, int numPerPage, int m_No) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.memberOrderList", m_No, rows); 
	}

	@Override
	public int memberOrderTotalContents(int m_No) {
		return sqlSession.selectOne("mypage.memberOrderTotalContents", m_No);
	}
	

	@Override
	public int deleteQuestion(String q_No) {
		return sqlSession.delete("mypage.deleteQuestion", q_No);
	}

	///////////////////////////// 관리자
	@Override
	public List<Map<String, String>> selectMember(int cPage, int numPerPage) { 
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectMember", null, rows); 
	}
	@Override
	public List<Map<String, String>> selectMemberY(int cPage, int numPerPage) { 
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectMemberY", null, rows); 
	}
	@Override
	public List<Map<String, String>> selectMemberN(int cPage, int numPerPage) { 
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectMemberN", null, rows); 
	}
	
	@Override
	public int selectMemberTotal() { return sqlSession.selectOne("mypage.selectMemberTotal");	}
	@Override
	public int selectMemberTotalY() { return sqlSession.selectOne("mypage.selectMemberTotalY");	}
	@Override
	public int selectMemberTotalN() { return sqlSession.selectOne("mypage.selectMemberTotalN");	}
	@Override
	public int todayJoinMember() { return sqlSession.selectOne("mypage.todayJoinMember");	}

	@Override
	public Member selectOneMember(int m_No) {
		return sqlSession.selectOne("mypage.selectOneMem", m_No);
	}

	@Override
	public int suspendMember(Member origincSuspension) {
		return sqlSession.update("mypage.suspendMember", origincSuspension);
	}

	@Override
	public int selectcbBoard() {
		return sqlSession.selectOne("mypage.selectcbBoard");
	}

	@Override
	public List<Map<String, String>> managementCB(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("mypage.managementCB", null, rows);
	}

	@Override
	public int insertcbBoard(cbBoard cbBoard) {
		return sqlSession.insert("mypage.insertcbBoard", cbBoard);
	}

	@Override
	public cbBoard selectOnecbBoard(String cb_no) {
		return sqlSession.selectOne("mypage.selectOnecbBoard", cb_no);
	}
	
	@Override
	public int updatecbBoard(cbBoard cbBoard) {
		return sqlSession.update("mypage.updatecbBoard", cbBoard);
	}
	
	@Override
	public int deletecbBoard(String cb_no) {
		return sqlSession.delete("mypage.deletecbBoard", cb_no);
	}

	@Override
	public List<Map<String, String>> selectdtBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectdtBoardList", null, rows);
	}
	@Override
	public int selectdtBoardTotalContents() {
		return sqlSession.selectOne("mypage.selectdtBoardTotalContents");
	}
	
	@Override
	public List<Map<String, String>> selectdtBoardListY(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectdtBoardListY", null, rows);
	}
	@Override
	public int selectdtBoardTotalContentsY() {
		return sqlSession.selectOne("mypage.selectdtBoardTotalContentsY");
	}
	
	@Override
	public List<Map<String, String>> selectdtBoardListN(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectdtBoardListN", null, rows);
	}
	@Override
	public int selectdtBoardTotalContentsN() {
		return sqlSession.selectOne("mypage.selectdtBoardTotalContentsN");
	}
	
	///////////// 커뮤니티
	
	@Override
	public List<Map<String, String>> selectcoBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectcoBoard", null, rows);
	}
	@Override
	public List<Map<String, String>> selectcoBoardListcount(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectcoBoardListcount", null, rows);
	}
	@Override
	public List<Map<String, String>> selectcoBoardListcomment(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectcoBoardListcomment", null, rows);
	}
	
	@Override
	public int selectcoBoardTotalContents() { return sqlSession.selectOne("mypage.selectcoBoardTotalContent"); }


	
	@Override
	public int updateStatus(DtBoard dtboard) {
		return sqlSession.update("mypage.updateStatus", dtboard);
	}

	@Override
	public Member memberDetail(int m_No) {
		return sqlSession.selectOne("mypage.memberDetail", m_No);
	}
	
    ///////////// 공지사항
    
    @Override
    public List<Map<String, String>> managementNotice(int cPage, int numPerPage) {
    RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
        return sqlSession.selectList("mypage.managementNotice", null, rows);
    }
    
    @Override
    public int selectNotice() {
    
        return sqlSession.selectOne("mypage.selectNotice");
    }
    
    @Override
    public int insertNotice(Notice notice) {
    
        return sqlSession.insert("mypage.insertNotice", notice);
    }
    
    @Override
    public Notice noticeUpdateView(int n_no) {
    
        return sqlSession.selectOne("mypage.noticeUpdateView", n_no);
    }
    
    @Override
    public int noticeUpdate(Notice notice) {
    
        return sqlSession.update("mypage.noticeUpdate", notice);
    }
    
    /*
    @Override
    public int noticeDelete(int n_no) {
    
    return sqlSession.delete("mypage.noticeDelete", n_no);
    }
    */
    
    @Override
    public int noticeDelete(String n_no) {
    
        return  sqlSession.delete("mypage.noticeDelete", n_no);
    }

	@Override
	public List<Map<String, String>> selectHTboardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectHTboardList", null, rows);
	}

	@Override
	public int selectTotalContentsHT() {
		return sqlSession.selectOne("mypage.selectTotalContentsHT");
	}

	@Override
	public int womanMember() { return sqlSession.selectOne("mypage.womanMember"); }; 
	@Override
	public int manMember() { return sqlSession.selectOne("mypage.manMember"); }

	@Override
	public List<dateJoin> dataJoinList() {
		 return sqlSession.selectList("mypage.dataJoinList");
	}

	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectQuestionList", null, rows); 
	}
	@Override
	public List<Map<String, String>> selectProductQuestionList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectProductQuestionList", null, rows); 
	}
	
	@Override
	public int selectQuestionTotalContents() {
		return sqlSession.selectOne("mypage.selectQuestionTotalContents");
	}

	@Override
	public int selectProductQuestionTotalContents() {
		return sqlSession.selectOne("mypage.selectProductQuestionTotalContents");
	}

	@Override
	public List<boardCount> HomeTrainingCount() {
		return sqlSession.selectList("mypage.HomeTrainingCount");
	}

	@Override
	public ht_board bestHT() {
		return sqlSession.selectOne("mypage.bestHT");
	}

	@Override
	public List<boardCount> bestHomeTraining() {
		return sqlSession.selectList("mypage.bestHomeTraining");
	}

	@Override
	public int insertAnswer(Question question) {
		return sqlSession.update("mypage.insertAnswer", question);
	}

	///////////// 관리자 주문관리
	
	@Override
	public List<Map<String, String>> selectOrdersList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectOrdersList", null, rows); 
	}
	@Override
	public List<Map<String, String>> selectOrdersListY(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectOrdersListY", null, rows); 
	}
	@Override
	public List<Map<String, String>> selectOrdersListN(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectOrdersListN", null, rows); 
	}

	@Override
	public int selectOrdersTotalContents() { return sqlSession.selectOne("mypage.selectOrdersTotalContents"); }
	@Override
	public int selectOrdersTotalContentsY() { return sqlSession.selectOne("mypage.selectOrdersTotalContentsY"); }
	@Override
	public int selectOrdersTotalContentsN() { return sqlSession.selectOne("mypage.selectOrdersTotalContentsN"); }

	@Override
	public List<Map<String, String>> selectOrderViewList(int o_No) {
		return sqlSession.selectList("mypage.selectOrderViewList", o_No);
	}

	@Override
	public int updateOrder(int o_No) {
		return sqlSession.update("mypage.updateOrder", o_No);
	}
	
	@Override
	public int yesterdaySale() { return sqlSession.selectOne("mypage.yesterdaySale");	}
	@Override
	public int todaySale() { return sqlSession.selectOne("mypage.todaySale");	}
	@Override
	public int monthSale() { return sqlSession.selectOne("mypage.monthSale");	}
	@Override
	public int yesterdayOrders() { return sqlSession.selectOne("mypage.yesterdayOrders");	}
	@Override
	public int todayOrders() { return sqlSession.selectOne("mypage.todayOrders");	}
	
	@Override
	public int livingSale() { return sqlSession.selectOne("mypage.livingSale");	}
	@Override
	public int foodSale() { return sqlSession.selectOne("mypage.foodSale");	}
	@Override
	public int beautySale() { return sqlSession.selectOne("mypage.beautySale");	}
	
	@Override
	public int weekendSaleSum() { return sqlSession.selectOne("mypage.weekendSaleSum");	}
	@Override
	public int previousweekendSum() { return sqlSession.selectOne("mypage.previousweekendSum");	}

	@Override
	public List<sale> weekendSale() { return sqlSession.selectList("mypage.weekendSale");	}
	@Override
	public List<sale> previousweekendSale() { return sqlSession.selectList("mypage.previousweekendSale");	}
	@Override
	public List<Orders> selectBestProduct() { return sqlSession.selectList("mypage.selectBestProduct");	}
	
	@Override
	public int womanOrders() { return sqlSession.selectOne("mypage.womanOrders");	}
	@Override
	public int manOrders() { return sqlSession.selectOne("mypage.manOrders");	}
	@Override
	public int allOrders() { return sqlSession.selectOne("mypage.allOrders");	}

	//추가
	@Override
	public List<Map<String, String>> selectadBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectadBoardList", null, rows);
	}

	@Override
	public List<Map<String, String>> selectadBoardListY(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectadBoardListY", null, rows);
	}

	@Override
	public List<Map<String, String>> selectadBoardListN(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypage.selectadBoardListN", null, rows);
	}
	
	@Override
	public int selectadBoardTotalContents() {
		return sqlSession.selectOne("mypage.selectadBoardTotalContents");
	}

	@Override
	public int selectadBoardTotalContentsY() {
		return sqlSession.selectOne("mypage.selectadBoardTotalContentsY");
	}

	@Override
	public int selectadBoardTotalContentsN() {
		return sqlSession.selectOne("mypage.selectadBoardTotalContentsN");
	}

	@Override
	public int adupdateStatus(AdBoard adboard) {
		return sqlSession.update("mypage.adupdateStatus", adboard);
	}

}
