package com.kh.yourfit.ht_board.model.vo;

import java.sql.Date;
import java.util.List;

import com.kh.yourfit.board_file.model.vo.board_file;

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
public class ht_board {

	private String ht_No;
	private String ht_Type;
	private String ht_Title;
	private String ht_Content;
	private int ht_Count;
	private int ht_Time;
	private String ht_Part;
	private String ht_Level;
	private int ht_Cal;
	private String ht_Intro;
	private int ht_Mno;
	private Date ht_Date;
	private String ht_Src;
	private int commentcount;
}
