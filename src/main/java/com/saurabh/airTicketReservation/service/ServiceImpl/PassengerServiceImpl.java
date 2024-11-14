package com.saurabh.airTicketReservation.service.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saurabh.airTicketReservation.model.Flight;
import com.saurabh.airTicketReservation.model.Passenger;
import com.saurabh.airTicketReservation.model.User;
import com.saurabh.airTicketReservation.repository.PassengerRepository;
import com.saurabh.airTicketReservation.service.PassengerService;
@Service
public class PassengerServiceImpl implements PassengerService {

    private PassengerRepository passengerRepository;

    @Autowired
    public PassengerServiceImpl(PassengerRepository passengerRepository){
        this.passengerRepository = passengerRepository;
    }
    
    @Override
    public List<Passenger> getAllPassengers() {
        return passengerRepository.findAll();
    }

    @Override
    public Passenger getPassengerById(Long passengerId) {
        return passengerRepository.findById(passengerId).orElse(null);
    }

    @Override
    public Passenger savePassenger(Passenger passenger) {
        return passengerRepository.save(passenger);
    }

    @Override
    public void deletePassengerById(Long passengerId) {
        passengerRepository.deleteById(passengerId);
    }


	@Override
	public List<Passenger> findAllByFlightEqualsAndUserEquals(Flight flight, User user) {
		return passengerRepository.findAllByFlightEqualsAndUserEquals( flight, user);
	}



	
}
