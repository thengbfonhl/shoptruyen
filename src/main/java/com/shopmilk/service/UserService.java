package com.shopmilk.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.shopmilk.entities.User;

public interface UserService extends UserDetailsService {
	public boolean addUser(User user);

	public List<User> findAll();

	public User findById(int id);

	public void updateRole(int id, String role);

	public void deleteUser(int id);

	public long countUsers();
}

