package com.kh.yourfit.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.common.exception.DtBoardException;
import com.kh.yourfit.common.exception.ProductException;
import com.kh.yourfit.product.model.dao.ProductDAO;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_Review.model.vo.ProductReview;
import com.kh.yourfit.product_img.model.vo.product_img;
import com.kh.yourfit.question.model.vo.Question;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage) {
		
		return productDAO.selectProductList(cPage, numPerPage);
	}

	@Override
	public int selectProductTotalContents() {
		
		return productDAO.selectProductTotalContents();
	}

	@Override
	public int insertProduct(Product product, List<product_img> fileList) {
		int result1 = productDAO.insertProduct(product);
		
		if(result1 == 0 ) throw new ProductException("상품 등록오류");
		
		if(fileList.size() > 0) {
			for(product_img pi : fileList) {
				int result2 = productDAO.insertProductImg(pi);
				if( result2 == 0) throw new ProductException("상품이미지 등록 오류");
			}
		}
		return result1;
	}

	@Override
	public Product selectOneProduct(int p_No) {
		
		Product product = productDAO.selectOneProduct(p_No);
		
		if(product != null ) productDAO.updateReadCount(p_No);
		
		return product;
	}

	@Override
	public List<product_img> selectProductImgList(int p_No) {
		
		return productDAO.selectProductImgList(p_No);
	}

	@Override
	public Product updateView(int p_No) {
		
		return productDAO.selectOneProduct(p_No);
	}

	@Override
	public int updateProduct(Product product, List<product_img> productimgList) {
		int totalResult = 0;
		
		List<product_img> originList = productDAO.selectProductImgList(product.getP_No());
		
		totalResult = productDAO.updateProduct(product);
		
		if(totalResult == 0 ) throw new ProductException("상품 수정 실패!");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = productDAO.deleteProductImg(product.getP_No());
			
			if(totalResult == 0) throw new ProductException("첨부 파일 이미지 삭제 실패!");
		}
		
		
		if( productimgList.size() > 0) {
			for(product_img pi : productimgList) {
				
				totalResult = productDAO.updateProductImg(pi);
				
				if( totalResult == 0 ) throw new DtBoardException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteProduct(int p_No) {
		
		return productDAO.deleteProduct(p_No);
	}

	@Override
	public int insertReview(ProductReview productReview) {
		return productDAO.insertReview(productReview);
	}

	@Override
	public List<ProductReview> selectReviewlist(int p_No) {
		return productDAO.selectReviewlist(p_No);
	}

	@Override
	public int deleteReview(int r_No) {
		return productDAO.deleteReview(r_No);
	}

	@Override
	public int updateReview(ProductReview productReview) {
		return productDAO.updateReview(productReview);
	}

	@Override
	public int insertQuestion(Question question) {
		return productDAO.insertQuestion(question);
	}

	@Override
	public List<Question> selectQuestionlist(int p_No) {
		return productDAO.selectQuestionlist(p_No);
	}
	
	@Override
	public List<Map<String, String>> selectProductListLiv(int cPage, int numPerPage) {
		
		return productDAO.selectProductListLiv(cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectProductListFh(int cPage, int numPerPage) {
		
		return productDAO.selectProductListFh(cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectProductListBea(int cPage, int numPerPage) {
	
		return productDAO.selectProductListBea(cPage, numPerPage);
	}
	
	@Override
	public List<Map<String, String>> productSearch(int cPage, int numPerPage, String keyword, String searchType) {
		
		return productDAO.productSearch(cPage, numPerPage, keyword, searchType);
	}

	@Override
	public int productSearchCount(String keyword) {
		
		return productDAO.productSearchCount(keyword);
	}
}
