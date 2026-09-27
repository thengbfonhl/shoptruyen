package com.shoptruyen.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import com.shoptruyen.entities.OrderDetail;
import com.shoptruyen.entities.OrderDetailId;

public interface OrderDetailRepo extends CrudRepository<OrderDetail, OrderDetailId> {
    List<OrderDetail> findByIdOrderId(int orderId);
}
