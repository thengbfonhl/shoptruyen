package com.shoptruyen.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shoptruyen.entities.Category;

public interface CategoryRepo extends CrudRepository<Category, Integer> {
	
	  List<Category> findByNameContaining(String q);
	
}
