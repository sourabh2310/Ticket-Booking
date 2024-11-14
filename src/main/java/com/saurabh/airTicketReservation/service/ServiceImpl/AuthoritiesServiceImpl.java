package com.saurabh.airTicketReservation.service.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saurabh.airTicketReservation.model.Authorities;
import com.saurabh.airTicketReservation.repository.AuthoritiesRepository;
import com.saurabh.airTicketReservation.service.AuthoritiesService;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService {

	
	@Autowired
	private AuthoritiesRepository authoritiesRepository;
	
	@Override
	public List<Authorities> getAuthorities() {
		return authoritiesRepository.findAll();
	}

	
	@Override
	public void saveAuthorities(Authorities theAuthorities) {
		authoritiesRepository.save(theAuthorities);

	}

	@Override
	public Authorities getAuthorities(String theId) {
		return authoritiesRepository.findById(theId).orElse(null);
	}

	@Override
	public void deleteAuthorities(String theId) {
		authoritiesRepository.deleteById(theId);

	}

}
