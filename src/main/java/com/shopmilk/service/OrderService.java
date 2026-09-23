package com.shopmilk.service;

import java.util.List;

import com.shopmilk.entities.Order;

public interface OrderService {

	Iterable<Order> findAll();

	// Lấy đơn hàng theo trạng thái: 0=Chờ xác nhận, 1=Đang giao, 2=Hoàn thành, 3=Hủy
	List<Order> getByStatus(int status);

	// Giữ tương thích cũ
	List<Order> getNewOrder();
	List<Order> getCheckedOrder();

	Order findById(int id);

	void save(Order order);

	void update(Order order);

	// Thống kê doanh thu theo tháng [[month, revenue], ...]
	List<Object[]> getMonthlyRevenue();

	// Thống kê doanh thu theo thứ trong tuần
	List<Object[]> getWeeklyRevenue();

	// Đếm đơn theo trạng thái
	long countByStatus(int status);

}

