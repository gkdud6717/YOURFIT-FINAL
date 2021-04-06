package com.kh.yourfit.event.model.vo;

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
public class event {
	private int e_No;
	private int e_Mno;
	private String e_Title;
	private String e_Content;
	private Date e_Date;
	private int e_Count;
	private String e_Status;
	private Date e_Start;
	private Date e_End;
	private List<board_file> files = new ArrayList<>();	
	private String nick;
}
