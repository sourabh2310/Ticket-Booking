package com.saurabh.airTicketReservation.service;

import java.util.List;

import com.saurabh.airTicketReservation.model.User;

public interface UserService  {

	public List<User> getUser();

	public User saveUser(User theUser);

	public User getUserById(long theId);

	public void deleteUserById(long theId);
	
	public User getUserByUsername(String username);

}
