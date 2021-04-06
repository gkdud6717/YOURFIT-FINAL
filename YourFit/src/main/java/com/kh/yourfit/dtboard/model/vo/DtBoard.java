package com.kh.yourfit.dtboard.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.kh.yourfit.board_comment.model.vo.board_comment;
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
public class DtBoard {
	
	private String dt_No;  
	private String dt_Type;  
	private String dt_Title;
	private String dt_Content;
	private int dt_Count;
	private int dt_Mno;
	private String nick;
	private List<board_file> files = new ArrayList<>();
	private List<board_comment> comment = new ArrayList<>();
	private String status;
	private int commentcount;
}
