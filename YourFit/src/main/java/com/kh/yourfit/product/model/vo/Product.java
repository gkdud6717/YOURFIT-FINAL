package com.kh.yourfit.product.model.vo;

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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
	
	private int p_No;
	private String p_Name;
	private String p_Type;
	private int p_Price;
	private String p_Content;
	private int p_Quantity;
	private int p_Count;
	private List<product_img> files = new ArrayList<>();
	

}
