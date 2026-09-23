package com.shopmilk.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import com.shopmilk.entities.OrderDetail;
import com.shopmilk.entities.OrderDetailId;

public interface OrderDetailRepo extends CrudRepository<OrderDetail, OrderDetailId> {
    List<OrderDetail> findByIdOrderId(int orderId);
}
