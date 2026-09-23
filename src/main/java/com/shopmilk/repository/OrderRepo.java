package com.shopmilk.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.shopmilk.entities.Order;

public interface OrderRepo extends JpaRepository<Order, Integer> {
    List<Order> findByStatusOrderByIdDesc(int status);

    List<Order> findAllByOrderByIdDesc();

    @Query("SELECT MONTH(o.date), SUM(o.total) FROM Order o WHERE o.status = 2 GROUP BY MONTH(o.date) ORDER BY MONTH(o.date)")
    List<Object[]> getMonthlyRevenue();

    // Doanh thu theo thứ trong tuần (1=Chủ nhật, 2=Thứ 2, ..., 7=Thứ 7)
    @Query(value = "SELECT DAYOFWEEK(date) AS day_of_week, SUM(total) FROM `order` WHERE status = 2 GROUP BY day_of_week ORDER BY day_of_week", nativeQuery = true)
    List<Object[]> getWeeklyRevenue();

    @Query("SELECT COUNT(o) FROM Order o WHERE o.status = :status")
    long countByStatus(int status);
}
