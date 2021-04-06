package com.kh.yourfit.index_list.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

@Repository
public class IndexDAOImpl implements IndexDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		 RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
	        
		return sqlSession.selectList("index.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return sqlSession.selectOne("index.selectNoticeTotalContents");
	}

	@Override
	public Notice noticeUpdateView(int n_no) {
		
		return sqlSession.selectOne("index.noticeUpdateView", n_no);
	}
	
	@Override
	public List<Member> selectMemberList() {
		return sqlSession.selectList("index.selectMemberList");
	}

	@Override
	public List<DtBoard> selectDTList() {
		return sqlSession.selectList("index.selectDTList");
	}

	@Override
	public List<ht_board> selectHTList() {
		
		return sqlSession.selectList("index.selectHTList");
	}
	
	@Override
	public List<Map<Product, product_img>> selectProductList() {
		
		return sqlSession.selectList("index.selectProductList");
	}

	@Override
	public List<Map<String, String>> selectadBoardList() {
		return sqlSession.selectList("index.selectadBoardList");
	}
	
}
