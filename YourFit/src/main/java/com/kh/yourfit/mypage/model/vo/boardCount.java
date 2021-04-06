package com.kh.yourfit.mypage.model.vo;

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
public class boardCount {	
	private int total;
	private int count;
	private String type;
	private String title;
	private String src;
	private String no;
	
}
