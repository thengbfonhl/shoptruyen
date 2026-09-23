package com.shopmilk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopmilk.entities.Category;
import com.shopmilk.repository.CategoryRepo;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepo cateRepo;

	@Override
	public Iterable<Category> findAll() {
		return cateRepo.findAll();
	}

	@Override
	public List<Category> search(String q) {
		return cateRepo.findByNameContaining(q);
	}

	@Override
	public Category findById(int id) {
		return cateRepo.findById(id).orElse(null);
	}

	@Override
	public void save(Category category) {
		cateRepo.save(category);
	}

	@Override
	public void delete(int id) {
		cateRepo.deleteById(id);
	}

}
