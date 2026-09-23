package com.shopmilk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shopmilk.entities.Product;

@Repository
public interface ProductRepo extends JpaRepository<Product, Integer> {

    // Tìm theo tên chứa chuỗi
    List<Product> findByNameContaining(String q);

    // Tìm theo khoảng giá
    List<Product> findByPriceBetween(long from, long to);

    // Tìm theo category
    List<Product> findByCategoryId(int categoryId);

    // Tìm theo category và khoảng giá
    List<Product> findByCategoryIdAndPriceBetween(int categoryId, long from, long to);

    // Tìm sản phẩm theo tên chính xác (có thể trùng tên, nên lấy bản ghi đầu tiên theo id)
    Product findFirstByNameOrderByIdAsc(String name);

    // Top N sản phẩm bán chạy nhất (tổng quantity từ order_detail, đơn đã hoàn thành)
    @Query(nativeQuery = true, value =
        "SELECT p.id, p.name, p.image, SUM(od.quantity) as total_sold " +
        "FROM product p " +
        "JOIN order_detail od ON p.id = od.product_id " +
        "JOIN `order` o ON o.id = od.order_id " +
        "WHERE o.status = 2 " +
        "GROUP BY p.id, p.name, p.image " +
        "ORDER BY total_sold DESC " +
        "LIMIT ?1")
    List<Object> getTopBestSellers(int limit);

    // Tổng số lượng đã bán theo từng sản phẩm (cho thống kê)
    @Query(nativeQuery = true, value =
        "SELECT p.id, p.name, p.quantity as stock, COALESCE(SUM(od.quantity), 0) as sold " +
        "FROM product p " +
        "LEFT JOIN order_detail od ON p.id = od.product_id " +
        "LEFT JOIN `order` o ON o.id = od.order_id AND o.status = 2 " +
        "GROUP BY p.id, p.name, p.quantity " +
        "ORDER BY sold DESC " +
        "LIMIT ?1")
    List<Object[]> getProductStockAndSold(int limit);
}