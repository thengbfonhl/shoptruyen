package com.shopmilk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shopmilk.entities.User;
import com.shopmilk.repository.UserRepo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepo userRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		return userRepo.findUserByEmail(email);
	}

	@Override
	public boolean addUser(User user) {
		if (userRepo.findUserByEmail(user.getMail()) != null) {
			return false;
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		user.setPassword(encoder.encode(user.getPassword()));
		user.setRole("user");
		userRepo.save(user);
		return true;
	}

	@Override
	public List<User> findAll() {
		return userRepo.findAll();
	}

	@Override
	public User findById(int id) {
		return userRepo.findById(id).orElse(null);
	}

	@Override
	public void updateRole(int id, String role) {
		User user = userRepo.findById(id).orElse(null);
		if (user != null) {
			user.setRole(role);
			userRepo.save(user);
		}
	}

	@Override
	public void deleteUser(int id) {
		userRepo.deleteById(id);
	}

	@Override
	public long countUsers() {
		return userRepo.countAllUsers();
	}

}

