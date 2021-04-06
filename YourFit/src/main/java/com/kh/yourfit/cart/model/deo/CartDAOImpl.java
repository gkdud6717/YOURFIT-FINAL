package com.kh.yourfit.cart.model.deo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.cart.model.vo.Cart;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertCart(Cart cart) {
		return sqlSession.insert("cartMapper.insertCart", cart);
	}


	@Override
	public List<Cart> cartList(int c_Mno) {
		return sqlSession.selectList("cartMapper.cartList", c_Mno);
	}


	@Override
	public int sumMoney(int c_Mno) {
		return ((Integer)sqlSession.selectOne("cartMapper.sumMoney", c_Mno));
	}


	@Override
	public int cartDelete(int c_No) {
		return sqlSession.delete("cartMapper.cartDelete", c_No);
	}


	@Override
	public int selectTotalCount(int c_Mno) {
		return sqlSession.selectOne("cartMapper.selectTotalCount", c_Mno);
	}

}
