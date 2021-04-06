package com.kh.yourfit.board_file.model.vo;

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
public class board_file {
	private int f_No;
	private int f_Type;
	private String f_Name;
	private String f_Cname;
	private String f_Path;
	private Date f_UploadDate;
	private String f_Htno;
	private String f_Cono;
	private String f_Dtno;
	private String f_Adno;
	private int f_Eno;
	private String co_No;
	private String dt_No;
	private int e_No;
	private String ad_No;
}
