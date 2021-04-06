package com.kh.yourfit.orders.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.yourfit.orders.model.service.ordersService;
import com.kh.yourfit.orders.model.vo.Orders;

@Controller
public class OrdersController {

	@Autowired
	ordersService ordersService;
	
	@RequestMapping("/orders/ordersinsert.do")
	public String ordersinsert(Orders orders, Model model) {
		System.out.println(orders);
		
		int result = ordersService.ordersinsert(orders);
		
		return null;
	}

}
