package com.kh.yourfit.index_list.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.index_list.model.dao.IndexDAO;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	IndexDAO IndexDAO;

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return IndexDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return IndexDAO.selectNoticeTotalContents();
	}

	@Override
	public Notice noticeUpdateView(int n_no) {
		
		return IndexDAO.noticeUpdateView(n_no);
	}
	
	@Override
	public List<Member> selectMemberList() {

		return IndexDAO.selectMemberList();
	}

	@Override
	public List<DtBoard> selectDTList() {
		return IndexDAO.selectDTList();
	}

	@Override
	public List<ht_board> selectHTList() {
		
		return IndexDAO.selectHTList();
	}
	
	@Override
	public List<Map<Product, product_img>> selectProductList() {
		
		return IndexDAO.selectProductList();
	}
	
	@Override
	public List<Map<String, String>> selectadBoardList() {
		return IndexDAO.selectadBoardList();
	}

}
