package com.shopmilk.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shopmilk.entities.Category;

public interface CategoryRepo extends CrudRepository<Category, Integer> {
	
	  List<Category> findByNameContaining(String q);
	
}
