package com.shoptruyen.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoptruyen.entities.OrderDetail;
import com.shoptruyen.repository.OrderDetailRepo;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailRepo orderDetailRepo;

	@Override
	public List<OrderDetail> findByOrderID(int id) {
		return orderDetailRepo.findByIdOrderId(id);
	}

	@Override
	public void save(OrderDetail orderDetail) {
		orderDetailRepo.save(orderDetail);
	}

	@Override
	public void update(OrderDetail orderDetail) {
		orderDetailRepo.save(orderDetail);
	}

}
