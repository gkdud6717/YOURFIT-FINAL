package com.kh.yourfit.co_board.model.vo;

import java.sql.Date;
import java.util.ArrayList;
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

public class co_board {
	private String co_No;
	private String co_Type;
	private String co_Title;
	private String co_Content;
	private Date co_Date;
	private int co_Count;
	private String co_Status;
	private int co_Mno;
	private String nick;
	private int commentcount;
	private List<board_file> files = new ArrayList<board_file>();
}
