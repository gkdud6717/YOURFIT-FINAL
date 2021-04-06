package com.kh.yourfit.orders.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.orders.model.dao.ordersDAO;
import com.kh.yourfit.orders.model.vo.Orders;

@Service
public class ordersServiceImpl implements ordersService {

	@Autowired
	ordersDAO ordersDAO;
	
	@Override
	public int ordersinsert(Orders orders) {
		return ordersDAO.ordersinsert(orders);
	}

}
