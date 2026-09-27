package com.shoptruyen.service;

import java.util.List;

import com.shoptruyen.entities.Category;

public interface CategoryService {
	
	Iterable<Category> findAll();

    List<Category> search(String q);

    Category findById(int id);

    void save(Category category);

    void delete(int id);
	
}
