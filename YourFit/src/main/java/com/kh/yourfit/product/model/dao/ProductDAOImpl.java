package com.kh.yourfit.product.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.orders.model.vo.Orders;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_Review.model.vo.ProductReview;
import com.kh.yourfit.product_img.model.vo.product_img;
import com.kh.yourfit.question.model.vo.Question;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.selectProductList", null, rows);
	}

	@Override
	public int selectProductTotalContents() {
		
		return sqlSession.selectOne("productMapper.selectProductTotalContents");
	}

	@Override
	public int insertProduct(Product product) {
	
		return sqlSession.insert("productMapper.insertProduct", product);
	}

	@Override
	public int insertProductImg(product_img pi) {
	
		return sqlSession.insert("productMapper.insertProductImg", pi);
	}

	@Override
	public Product selectOneProduct(int p_No) {
		
		return sqlSession.selectOne("productMapper.selectOneProduct", p_No);
	}

	@Override
	public int updateReadCount(int p_No) {
		
		return sqlSession.update("productMapper.updateReadCount", p_No);
	}

	@Override
	public List<product_img> selectProductImgList(int p_No) {
		
		return sqlSession.selectList("productMapper.selectProductImgList", p_No);
	}

	@Override
	public int updateProduct(Product product) {
		
		return sqlSession.update("productMapper.updateProduct", product);
	}

	@Override
	public int deleteProductImg(int p_No) {
		
		return sqlSession.delete("productMapper.deleteProductImg", p_No);
	}

	@Override
	public int updateProductImg(product_img pi) {
		
		return sqlSession.insert("productMapper.updateProductImg", pi);
	}

	@Override
	public int deleteProduct(int p_No) {
	
		return sqlSession.delete("productMapper.deleteProduct", p_No);
	}

	@Override
	public int insertReview(ProductReview productReview) {
		return sqlSession.insert("productMapper.insertReview", productReview);
	}

	@Override
	public List<ProductReview> selectReviewlist(int p_No) {
		return sqlSession.selectList("productMapper.selectReviewlist", p_No);
	}

	@Override
	public int deleteReview(int r_No) {
		return sqlSession.delete("productMapper.deleteReview", r_No);
	}

	@Override
	public int updateReview(ProductReview productReview) {
		return sqlSession.update("productMapper.updateReview", productReview);
	}

	@Override
	public int insertQuestion(Question question) {
		return sqlSession.insert("productMapper.insertQuestion", question);
	}

	@Override
	public List<Question> selectQuestionlist(int p_No) {
		return sqlSession.selectList("productMapper.selectQuestionlist", p_No);
	}
	
	@Override
	public List<Map<String, String>> selectProductListLiv(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productMapper.selectProductListLiv", null, rows);
	}

	@Override
	public List<Map<String, String>> selectProductListFh(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productMapper.selectProductListFh", null, rows);
	}

	@Override
	public List<Map<String, String>> selectProductListBea(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productMapper.selectProductListBea", null, rows);
	}

	@Override
	public List<Map<String, String>> productSearch(int cPage, int numPerPage, String keyword, String searchType) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		
		return sqlSession.selectList("productMapper.productSearch", map, rows);
	}

	@Override
	public int productSearchCount(String keyword) {
		
		return sqlSession.update("productMapper.productSearchCount", keyword);
	}

}
