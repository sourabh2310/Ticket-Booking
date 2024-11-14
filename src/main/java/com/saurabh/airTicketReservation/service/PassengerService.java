package com.saurabh.airTicketReservation.service;

import java.util.List;

import com.saurabh.airTicketReservation.model.Flight;
import com.saurabh.airTicketReservation.model.Passenger;
import com.saurabh.airTicketReservation.model.User;

public interface PassengerService {
	
    public  List<Passenger> getAllPassengers();
    
    public  Passenger getPassengerById(Long passengerId);
    
    public  Passenger savePassenger(Passenger passenger);
    
    public  void deletePassengerById(Long passengerId);


	public  List<Passenger> findAllByFlightEqualsAndUserEquals(Flight flight, User user);

}
