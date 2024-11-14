package com.saurabh.airTicketReservation.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.saurabh.airTicketReservation.model.Flight;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long> {
	List<Flight> findAllByDepartureAirportEqualsAndDestinationAirportEqualsAndDepartureDateEquals(
			String departureAirport, String destinationAirport, LocalDate departureDate);

}
