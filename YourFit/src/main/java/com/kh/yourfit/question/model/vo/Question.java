package com.kh.yourfit.question.model.vo;

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
public class Question {
	private int q_No;
	private String q_Title;
	private String q_Content;
	private Date q_Date;
	private int q_Pno;
	private int q_Mno;
	private String q_Nick;
	private String q_Answer;
	private String p_Name;
	private List<product_img> files = new ArrayList<>();
}
