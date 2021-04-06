package com.kh.yourfit.notice.model.vo;

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


public class Notice {
	
	private int n_no;
	private int n_mno;
	private String n_title;
	private String n_content;
	private Date n_date;
	private int n_count;
	private String m_Name;
	private String m_Nick;

}
