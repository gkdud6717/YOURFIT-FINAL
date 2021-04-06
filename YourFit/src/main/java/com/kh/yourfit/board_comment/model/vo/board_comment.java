package com.kh.yourfit.board_comment.model.vo;

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
public class board_comment {
	private int bc_No;
	private String bc_Content;
	private Date bc_Date;
	private String bc_Type;
	private String bc_Dtno;
	private String bc_Htno;
	private String bc_Cono;
	private int bc_Mno;
	private String nick;
	private int commentcount;
}
