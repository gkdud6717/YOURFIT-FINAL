package com.kh.yourfit.cart.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.kh.yourfit.product_img.model.vo.product_img;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private int c_No;      // 장바구니 번호
	private int c_Amount;  // 상품수량
	private int c_Price;   // 상품가격
	private int c_Pno;     // 상품번호
	private int c_Mno;     // 회원번호
	private List<product_img> files = new ArrayList<>();
	private String c_Nick;
	private String p_Name;
	private int summoney;
	private int p_Price;
}
