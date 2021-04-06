package com.kh.yourfit.product_img.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class product_img {

	private int i_No;
	private String i_OriginName;
	private String i_ChangeName;
	private String i_ImgPath;
	private Date i_UploadDate;
	private String i_IsDelete;
	private int i_Pno;
	private int p_No;
}
