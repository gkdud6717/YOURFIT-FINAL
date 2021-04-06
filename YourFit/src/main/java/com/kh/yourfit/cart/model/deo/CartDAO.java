package com.kh.yourfit.cart.model.deo;

import java.util.List;

import com.kh.yourfit.cart.model.vo.Cart;

public interface CartDAO {

	
	int insertCart(Cart cart);

	List<Cart> cartList(int c_Mno);

	int sumMoney(int c_Mno);

	int cartDelete(int c_No);

	int selectTotalCount(int c_Mno); 
}
