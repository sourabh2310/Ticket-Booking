package com.saurabh.airTicketReservation.service.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saurabh.airTicketReservation.model.Users;
import com.saurabh.airTicketReservation.repository.UsersRepository;
import com.saurabh.airTicketReservation.service.UsersService;

@Service

public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersRepository UsersRepository;



	@Autowired
	public UsersServiceImpl(UsersRepository UsersRepository) {
		this.UsersRepository = UsersRepository;
	}

	@Override
	public List<Users> getUsers() {
		return UsersRepository.findAll();
	}

	@Override
	public Users getUsersById(String theId) {
		return UsersRepository.findById(theId).orElse(null);
	}

	@Override
	public Users saveUsers(Users Users) {
		return UsersRepository.save(Users);
	}

	@Override
	public void deleteUsersById(String theId) {
		UsersRepository.deleteById(theId);
	}




}
