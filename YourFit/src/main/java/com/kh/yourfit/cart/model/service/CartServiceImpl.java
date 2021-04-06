package com.kh.yourfit.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.cart.model.deo.CartDAO;
import com.kh.yourfit.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	@Override
	public int insertCart(Cart cart) {
		
		return cartDAO.insertCart(cart);
	}

	@Override
	public List<Cart> cartList(int c_Mno) {
		return cartDAO.cartList(c_Mno);
	}

	@Override
	public int sumMoney(int c_Mno) {
		return cartDAO.sumMoney(c_Mno);
	}

	@Override
	public int cartDelete(int c_No) {
		return cartDAO.cartDelete(c_No);
	}

	@Override
	public int selectTotalCount(int c_Mno) {
		return cartDAO.selectTotalCount(c_Mno);
	}

	

}
