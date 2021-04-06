package com.kh.yourfit.calorie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Calorie_Controller {
	
	@RequestMapping("/calorie/calorie_detail.do")
	public String calorie_detail() {
		return "calorie/calorie_detail";
	}
	


}
