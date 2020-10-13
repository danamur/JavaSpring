package com.danielnamur.javaexamsimulator.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.danielnamur.javaexamsimulator.models.User;
import com.danielnamur.javaexamsimulator.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepository.save(user);
	}
	
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	
	public User findByName(String name) {
		return userRepository.findByName(name);
	}
	
	public User findUserById(Long id) {
		Optional<User> u = userRepository.findById(id);
		
		if(u.isPresent()) {
			return u.get();
		}
		else {
			return null;
		}
	}
	
	public boolean authenticateUser(String email, String password) {
		User user = userRepository.findByEmail(email);
		if(user==null) {
			return false;
		}
		else {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
	}
	
	public void updateUser(User user) {
		userRepository.save(user);
	}
	
}