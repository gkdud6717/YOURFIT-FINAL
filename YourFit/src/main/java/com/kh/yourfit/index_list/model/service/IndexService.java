package com.kh.yourfit.index_list.model.service;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

public interface IndexService {
	
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	Notice noticeUpdateView(int n_no);
	
	List<Member> selectMemberList();

	List<DtBoard> selectDTList();

	List<ht_board> selectHTList();
	
	List<Map<Product, product_img>> selectProductList();
	
	List<Map<String, String>> selectadBoardList();

}
