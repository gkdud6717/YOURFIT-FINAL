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
public class dateJoin {
	private String dayJoin;
	private int dayJoinCnt;
	private int womanCount;
	private int manCount;
}
