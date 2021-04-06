package com.kh.yourfit.adBoard.model.vo;

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
public class AdBoard {
	private String ad_No;
	private int ad_Mno;
	private String ad_Title;
	private String ad_Content;
	private int ad_Count;
	private Date ad_Date;
	private List<board_file> files = new ArrayList<>();
	private String status;
	private String nick;
}
