package com.shopmilk.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopmilk.entities.Product;
import com.shopmilk.repository.ProductRepo;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepo productRepo;

    @Override
    public Iterable<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public List<Product> search(String q) {
        return productRepo.findByNameContaining(q);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id).orElse(null);
    }

    @Override
    public void save(Product product) {
        productRepo.save(product);
    }

    @Override
    public void delete(int id) {
        productRepo.deleteById(id);
    }

    @Override
    public List<Product> searchByCateID(int categoryId) {
        return productRepo.findByCategoryId(categoryId);
    }

    @Override
    public List<Product> SearchByPriceRange(long from, long to) {
        return productRepo.findByPriceBetween(from, to);
    }

    @Override
    public List<Product> SearchByCateAndPriceRange(int categoryId, long from, long to) {
        return productRepo.findByCategoryIdAndPriceBetween(categoryId, from, to);
    }

    @Override
    public void update(Product product) {
        productRepo.save(product); // Spring Data JPA tự xác định insert hay update
    }

    @Override
    public List<Product> getByMostViews(int topNumber) {
        // Lấy top N theo views dùng repository + Pageable
        return productRepo.findAll(org.springframework.data.domain.PageRequest.of(0, topNumber, 
                org.springframework.data.domain.Sort.by("views").descending())).getContent();
    }

	@Override
	public Product findByName(String name) {
		return productRepo.findFirstByNameOrderByIdAsc(name);
	}

	@Override
	public List<Object> getByBestSeller(int topNumber) {
		// Delegate sang query native trong repo
		return productRepo.getTopBestSellers(topNumber);
	}

	public long countProducts() {
		return productRepo.count();
	}

	@Override
	public List<Object[]> getProductStockAndSold(int limit) {
		return productRepo.getProductStockAndSold(limit);
	}

}