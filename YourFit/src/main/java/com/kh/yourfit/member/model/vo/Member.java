package com.kh.yourfit.member.model.vo;

import java.io.Serializable;
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
public class Member implements Serializable {

	private static final long serialVersionUID = 1001L;

	private int m_No;
	private String m_Id;
	private String m_Pwd;
	private String m_Name;
	private String m_Nick;
	private String m_Gender;
	private String m_Email;
	private String m_Phone;
	private String m_Address;
	private String m_Suspension;
	private Date m_Joindate;
	private int commentcount;
	private int boardcount;	
	
}
