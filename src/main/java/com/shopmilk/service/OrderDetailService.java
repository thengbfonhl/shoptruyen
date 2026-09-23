package com.shopmilk.service;

import java.util.List;

import com.shopmilk.entities.OrderDetail;

public interface OrderDetailService {

	List<OrderDetail> findByOrderID(int id);
	
	void save(OrderDetail orderDetail);
	
	void update(OrderDetail orderDetail);

}
