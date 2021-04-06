package com.kh.yourfit.orders.model.vo;

import java.sql.Date;
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
public class Orders {
	private int o_No;
	private int o_Pno;
	private Date o_Date;
	private int o_Amount;
	private String o_Paymethod;
	private int o_Payamount;
	private String o_Paystatus;
	private int o_Mno;
	private String p_Name;
	private int p_Price;
	private List<product_img> files = new ArrayList<>();
	
	///// 주문자 정보 확인용
	private String m_Name;
	private String m_Email;
	private String m_Phone;
	private String m_Address;
	
}
