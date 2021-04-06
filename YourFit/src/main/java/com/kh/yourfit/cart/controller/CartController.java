package com.kh.yourfit.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yourfit.cart.model.service.CartService;
import com.kh.yourfit.cart.model.vo.Cart;
import com.kh.yourfit.member.model.vo.Member;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	
	@RequestMapping("/cart/insertCart")
	@ResponseBody
	public String insertCart(Cart cart) {
	
		System.out.println("cart가 왔나요" + cart);
		/*
		 * Member member = (Member)session.getAttribute("member");
		 * cart.setC_Mno(member.getM_No());
		 * */
		 
		int result = cartService.insertCart(cart);
		System.out.println("result가 1인가요" + result);
	
		
		
		return "product/productView";
	}
	
	@RequestMapping("/cart/cartList.do")
	public String cartList(@RequestParam int c_Mno, Model model) {
		System.out.println("c_Mno가 왔는가요" + c_Mno);
		List<Cart> cartlist = cartService.cartList(c_Mno);
		int sumMoney = cartService.sumMoney(c_Mno); // 장바구니 전체 금액 호출

		int count = cartService.selectTotalCount(c_Mno);
		
		System.out.println(cartlist);
		System.out.println("sumMoney" + sumMoney);
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("count", count);
		return "cart/cartList";
		
	}
	
	@RequestMapping("/cart/cartDelete.do")
	public String cartDelete(@RequestParam int c_No, @RequestParam int c_Mno, Model model) {
		System.out.println("c_No" + c_No);
		System.out.println("c_Mno" + c_Mno);
		int result = cartService.cartDelete(c_No);
		
		model.addAttribute("c_Mno", c_Mno);
		return "redirect:/cart/cartList.do";
	}
	
	
	@RequestMapping("/cart/productbuypage.do")
	public String productbuypage(@RequestParam int o_Mno, Model model) {
		System.out.println("o_Mno 값 : " +o_Mno);
		// 상품명, 상품가격 , 상품수량 , 총 가격
		
		List<Cart> cartlist = cartService.cartList(o_Mno);
		int sumMoney = cartService.sumMoney(o_Mno);
		System.out.println("cartlist는? " +cartlist);
	
		
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("cartlist", cartlist);
		return "product/productBuyPage";
	}
}
