package com.saurabh.airTicketReservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.saurabh.airTicketReservation.model.Authorities;

@Repository
public interface AuthoritiesRepository extends JpaRepository<Authorities, String>{

}
