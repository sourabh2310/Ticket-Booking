package com.saurabh.airTicketReservation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.saurabh.airTicketReservation.model.Flight;
import com.saurabh.airTicketReservation.model.Passenger;
import com.saurabh.airTicketReservation.model.User;

@Repository
public interface PassengerRepository extends JpaRepository<Passenger, Long> {


	List<Passenger> findAllByFlightEqualsAndUserEquals(Flight flight, User user);


}
