package com.saurabh.airTicketReservation.service.ServiceImpl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saurabh.airTicketReservation.model.Flight;
import com.saurabh.airTicketReservation.repository.FlightRepository;
import com.saurabh.airTicketReservation.service.FlightService;

@Service
public class FlightServiceImpl implements FlightService {

	private FlightRepository flightRepository;

	@Autowired
	public FlightServiceImpl(FlightRepository flightRepository) {
		this.flightRepository = flightRepository;
	}

	@Override
	public List<Flight> getAllFlights() {
		return flightRepository.findAll();
	}

	@Override
	public Flight getFlightById(long flightId) {
		return flightRepository.findById(flightId).orElse(null);
	}

	@Override
	public Flight saveFlight(Flight flight) {
		return flightRepository.save(flight);
	}

	@Override
	public void deleteFlightById(long flightId) {
		flightRepository.deleteById(flightId);
	}

	@Override
	public List<Flight> findAllByDepartureAirportEqualsAndDestinationAirportEqualsAndDepartureDateEquals(
			String departureAirport, String destinationAirport, LocalDate departureDate) {
		return flightRepository.findAllByDepartureAirportEqualsAndDestinationAirportEqualsAndDepartureDateEquals(
				departureAirport, destinationAirport, departureDate);
	}

	

}
