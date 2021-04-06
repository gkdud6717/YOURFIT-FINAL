package com.kh.yourfit.orders.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.orders.model.vo.Orders;
@Repository
public class ordersDAOImpl implements ordersDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int ordersinsert(Orders orders) {
		return sqlSession.insert("OrdersMapper.ordersinsert", orders);
	}

}
