package com.saurabh.airTicketReservation.service;

import java.time.LocalDate;
import java.util.List;

import com.saurabh.airTicketReservation.model.Flight;

public interface FlightService {

	public  List<Flight> getAllFlights();

	public  Flight getFlightById(long flightId);

	public  Flight saveFlight(Flight flight);

	public  void deleteFlightById(long flightId);

	public  List<Flight> findAllByDepartureAirportEqualsAndDestinationAirportEqualsAndDepartureDateEquals(
			String departureAirport, String destinationAirport, LocalDate departureDate);

}
