package com.shopmilk.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopmilk.entities.Order;
import com.shopmilk.repository.OrderRepo;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepo orderRepo;

	@Override
	public Iterable<Order> findAll() {
		return orderRepo.findAllByOrderByIdDesc();
	}

	@Override
	public Order findById(int id) {
		return orderRepo.findById(id).orElse(null);
	}

	@Override
	public void save(Order order) {
		orderRepo.save(order);
	}

	@Override
	public void update(Order order) {
		orderRepo.save(order);
	}

	// status=0: Chờ xác nhận
	@Override
	public List<Order> getNewOrder() {
		return orderRepo.findByStatusOrderByIdDesc(0);
	}

	// status=2: Hoàn thành (tương thích cũ)
	@Override
	public List<Order> getCheckedOrder() {
		return orderRepo.findByStatusOrderByIdDesc(2);
	}

	@Override
	public List<Order> getByStatus(int status) {
		return orderRepo.findByStatusOrderByIdDesc(status);
	}

	@Override
	public List<Object[]> getMonthlyRevenue() {
		return orderRepo.getMonthlyRevenue();
	}

	@Override
	public List<Object[]> getWeeklyRevenue() {
		return orderRepo.getWeeklyRevenue();
	}

	@Override
	public long countByStatus(int status) {
		return orderRepo.countByStatus(status);
	}

}
