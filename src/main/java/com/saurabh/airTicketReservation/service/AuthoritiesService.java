package com.saurabh.airTicketReservation.service;

import java.util.List;

import com.saurabh.airTicketReservation.model.Authorities;

public interface AuthoritiesService {

	public List<Authorities> getAuthorities();

	public void saveAuthorities(Authorities theAuthorities);

	public Authorities getAuthorities(String theId);

	public void deleteAuthorities(String theId);
}
