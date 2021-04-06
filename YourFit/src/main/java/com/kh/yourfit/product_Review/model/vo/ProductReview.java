package com.kh.yourfit.product_Review.model.vo;

import java.sql.Date;

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
public class ProductReview {
	private int r_No;
	private String r_Title;
	private String r_Content;
	private Date r_Date;
	private int r_Grade;
	private int r_Pno;
	private int r_Mno;
	private String r_Nick;
}
