package com.shopmilk.service;

import java.util.List;

import com.shopmilk.entities.Product;

public interface ProductService {

	Iterable<Product> findAll();

	List<Product> search(String q);
	
	List<Product> searchByCateID(int id);
	
	List<Product> SearchByPriceRange(long from, long to);
	
	List<Product> SearchByCateAndPriceRange(int id, long from, long to);

	Product findById(int id);
	
	Product findByName(String name);
	
	List<Object> getByBestSeller(int topNumber);
	
	List<Product> getByMostViews(int topNumber);

	void save(Product product);
	
	void update(Product product);

	void delete(int id);

	// Thống kê tồn kho và đã bán
	List<Object[]> getProductStockAndSold(int limit);

	long countProducts();

}

