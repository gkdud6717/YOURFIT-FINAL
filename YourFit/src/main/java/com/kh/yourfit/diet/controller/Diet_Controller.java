package com.kh.yourfit.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Diet_Controller {
	
	@RequestMapping("/diet/diet_tips.do")
	public String diet_tips(){
		return "diet/diet_tips";
	}
	@RequestMapping("/diet/home_training.do")
	public String diet_home_training(){
		return "diet/home_training";
	}
	@RequestMapping("/diet/cal_dictonary.do")
	public String diet_cal_dictonary(){
		return "diet/cal_dictonary";
	}
	@RequestMapping("/diet/comunity.do")
	public String diet_all(){
		return "diet/comunity";
	}
	
	@RequestMapping("/diet/bmi.do")
	public String bmi(){
		return "diet/bmi";
	}
	
	@RequestMapping("/diet/bmiResult.do")
	public String bmiResult(){
		return "diet/bmiResult";
	}
}
