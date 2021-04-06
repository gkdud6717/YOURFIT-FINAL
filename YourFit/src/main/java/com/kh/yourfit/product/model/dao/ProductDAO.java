package com.kh.yourfit.product.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_Review.model.vo.ProductReview;
import com.kh.yourfit.product_img.model.vo.product_img;
import com.kh.yourfit.question.model.vo.Question;

public interface ProductDAO {

	List<Map<String, String>> selectProductList(int cPage, int numPerPage);

	int selectProductTotalContents();

	int insertProduct(Product product);

	int insertProductImg(product_img pi);

	Product selectOneProduct(int p_No);

	int updateReadCount(int p_No);

	List<product_img> selectProductImgList(int p_No);
	
	int updateProduct(Product product);

	int deleteProductImg(int p_No);

	int updateProductImg(product_img pi);

	int deleteProduct(int p_No);
	
	int insertReview(ProductReview productReview);

	List<ProductReview> selectReviewlist(int p_No);

	int deleteReview(int r_No);

	int updateReview(ProductReview productReview);

	int insertQuestion(Question question);

	List<Question> selectQuestionlist(int p_No);
	
	List<Map<String, String>> selectProductListLiv(int cPage, int numPerPage);

	List<Map<String, String>> selectProductListFh(int cPage, int numPerPage);

	List<Map<String, String>> selectProductListBea(int cPage, int numPerPage);

	List<Map<String, String>> productSearch(int cPage, int numPerPage, String keyword, String searchType);

	int productSearchCount(String keyword);


}
