package com.saurabh.airTicketReservation.service;

import java.util.List;

import com.saurabh.airTicketReservation.model.Users;

public interface UsersService  {

	public List<Users> getUsers();

	public Users saveUsers(Users theUsers);

	public Users getUsersById(String theId);

	public void deleteUsersById(String theId);

}
