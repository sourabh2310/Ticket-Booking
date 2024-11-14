package com.saurabh.airTicketReservation.service.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saurabh.airTicketReservation.model.User;
import com.saurabh.airTicketReservation.repository.UserRepository;
import com.saurabh.airTicketReservation.service.UserService;

@Service

public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;



	@Autowired
	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public List<User> getUser() {
		return userRepository.findAll();
	}

	@Override
	public User getUserById(long theId) {
		return userRepository.findById(theId).orElse(null);
	}

	@Override
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public void deleteUserById(long theId) {
		userRepository.deleteById(theId);
	}

	@Override
	public User getUserByUsername(String username) {
		return userRepository.findByUsername(username).orElse(null);
	}




}
