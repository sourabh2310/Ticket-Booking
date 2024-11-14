package com.saurabh.airTicketReservation.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.saurabh.airTicketReservation.model.Authorities;
import com.saurabh.airTicketReservation.model.Flight;
import com.saurabh.airTicketReservation.model.Passenger;
import com.saurabh.airTicketReservation.model.User;
import com.saurabh.airTicketReservation.model.Users;
import com.saurabh.airTicketReservation.service.AuthoritiesService;
import com.saurabh.airTicketReservation.service.FlightService;
import com.saurabh.airTicketReservation.service.PassengerService;
import com.saurabh.airTicketReservation.service.UserService;
import com.saurabh.airTicketReservation.service.UsersService;

@Controller
public class AirController {

	@Autowired
	private FlightService flightService;
	@Autowired
	private PassengerService passengerService;

	private long userIdSingle;

	@Autowired
	private AuthoritiesService authoritiesService;

	

	@Autowired
	private UserService userService;

	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showHomePage() {
		return "customerPage";
	}

	@GetMapping("/start")
	public String showFirstPage() {
		return "home-page";
	}

	@GetMapping("/customer/signUp")
	public String showRegistrationPage(Model model) {
		User theUser = new User();
		model.addAttribute("user", theUser);
		return "customerSignUp";
	}

	@PostMapping("/customer/processRegistrationForm")
	public String processRegistrationForm(@ModelAttribute("user") User theUser,
			Model theModel) {

		String userName = theUser.getUsername();
		
		boolean userExists = doesUserExist(userName);
		if (userExists) {
			theModel.addAttribute("user", new User());
			theModel.addAttribute("registrationError", "Users name already exists.");
			
			return "customerSignUp";
		} else {
			String message = null;

			Authorities theAuthorities = new Authorities(theUser.getUsername(), "ROLE_USER");
			authoritiesService.saveAuthorities(theAuthorities);
			
			Users theUsers = new Users(theUser.getUsername(), theUser.getPassword(), 1);
			usersService.saveUsers(theUsers);
			userService.saveUser(theUser);
			message = "Customer Register with id " + theUser.getUsername();

			theModel.addAttribute("message", message);
			theModel.addAttribute("customer", new User());
		
			return "customerRegistration";
		}
	}

	private boolean doesUserExist(String userName) {
		
		boolean exists = false;
		if (userService.getUserByUsername(userName) != null)
			exists = true;
		
		return exists;
	}

	@GetMapping("/customer/login")
	public String showLoginPage(Model model) {
		User theUser = new User();
		model.addAttribute("user", theUser);
		return "customerLogin";
	}

	@GetMapping("access-denied")
	public String showAccessDenied() {
		return "accessDenied";

	}

	@GetMapping("/customer/home")
	public String showCustomerPage() {
		return "customerPage";
	}

	@RequestMapping(value = "/customer/flight/search/{username}", method = RequestMethod.GET)
	public String showSearchFlightPage(@PathVariable("username") String username, Model model) {
		userIdSingle = userService.getUserByUsername(username).getUserId();
		List<Flight> flights = flightService.getAllFlights();
		List<String> departureAirportList = new ArrayList<>();
		List<String> destinationAirportList = new ArrayList<>();
		for (int i = 0; i < flights.size(); i++) {
			if (!departureAirportList.contains(flights.get(i).getDepartureAirport()))
				departureAirportList.add(flights.get(i).getDepartureAirport());
			if (!destinationAirportList.contains(flights.get(i).getDestinationAirport()))
				destinationAirportList.add(flights.get(i).getDestinationAirport());
		}
		model.addAttribute("departureAirportList", departureAirportList);
		model.addAttribute("destinationAirportList", destinationAirportList);
		model.addAttribute("flight", new Flight());
		return "customerSearchFlight";
	}

	@RequestMapping(value = "/customer/flight/search", method = RequestMethod.POST)
	public String searchFlight(@RequestParam("departureAirport") String departureAirport,
			@RequestParam("destinationAirport") String destinationAirport,
			@RequestParam("departureDate") String departureDate, Model model) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate deptDate = LocalDate.parse(departureDate, dtf);
		List<Flight> flights = flightService.getAllFlights();
		List<String> departureAirportList = new ArrayList<>();
		List<String> destinationAirportList = new ArrayList<>();
		for (int i = 0; i < flights.size(); i++) {
			if (!departureAirportList.contains(flights.get(i).getDepartureAirport()))
				departureAirportList.add(flights.get(i).getDepartureAirport());
			if (!destinationAirportList.contains(flights.get(i).getDestinationAirport()))
				destinationAirportList.add(flights.get(i).getDestinationAirport());
		}
		model.addAttribute("departureAirportList", departureAirportList);
		model.addAttribute("destinationAirportList", destinationAirportList);

		if (departureAirport == destinationAirport) {
			model.addAttribute("AirportError", "Departure and destination airport cant be same!");
			model.addAttribute("flight", new Flight());
			return "customerSearchFlight";
		}
		List<Flight> flightsSearch = flightService
				.findAllByDepartureAirportEqualsAndDestinationAirportEqualsAndDepartureDateEquals(departureAirport,
						destinationAirport, deptDate);
		if (flights.isEmpty()) {
			model.addAttribute("notFound", "No Record Found!");
			model.addAttribute("flight", new Flight());
			return "customerSearchFlight";
		} else {
			model.addAttribute("flight", flightsSearch);
			return "customerBookFlight";
		}
	}

	@RequestMapping(value = "/customer/bookingPage/{flightId}", method = RequestMethod.GET)
	public String showFlightDetails(@PathVariable("flightId") long flightId, Model model) {
		Flight flights = flightService.getFlightById(flightId);
		model.addAttribute("flight", flights);
		List<Passenger> passengers = flightService.getFlightById(flightId).getPassengers();
		model.addAttribute("passenger", passengers);
		return "customerBookingPage";
	}

	@RequestMapping(value = "/customer/flight/book/newPassenger/{flightId}", method = RequestMethod.GET)
	public String showCustomerInfoPage(@PathVariable long flightId, Model model) {
		Flight flight = flightService.getFlightById(flightId);
		model.addAttribute("flight", flight);
		model.addAttribute("passenger", new Passenger());
		return "customerNewPassenger";
	}

	@RequestMapping(value = "/customer/flight/book/addPassenger/{flightId}", method = RequestMethod.POST)
	public String bookFlight(@ModelAttribute("passenger") Passenger passenger,
			@PathVariable("flightId") long flightId, Model model) {
		Flight flight = flightService.getFlightById(flightId);
		Passenger passenger1 = passenger;
		passenger1.setFlight(flight);
		passenger1.setUser(userService.getUserById(userIdSingle));
		model.addAttribute("flight", flight);
		passengerService.savePassenger(passenger1);
		List<Passenger> passengers = passengerService.findAllByFlightEqualsAndUserEquals(
				flightService.getFlightById(flightId), userService.getUserById(userIdSingle));
		model.addAttribute("passengers", passengers);
		return "customerBookingPage";
	}

	@RequestMapping(value = "/customer/flights/{username}", method = RequestMethod.GET)
	public String showCustomerFlightsList(@PathVariable("username") String username, Model model) {
		userIdSingle = userService.getUserByUsername(username).getUserId();
		List<Passenger> passengerList = userService.getUserById(userIdSingle).getPassengers();
		List<Flight> flight = new ArrayList<Flight>();
		for(int i=0; i<passengerList.size(); i++) {
			if(userService.getUserById(userIdSingle)==passengerList.get(i).getUser()  && !flight.contains(passengerList.get(i).getFlight())) {
				flight.add(passengerList.get(i).getFlight());
			}
		}
		model.addAttribute("flight", flight);
		return "customerFlights";
	}

	@RequestMapping(value = "/customer/passengers/{flightId}", method = RequestMethod.GET)
	public String showPassengerList(@PathVariable("flightId") long flightId, Model model) {
		List<Passenger> passengers = passengerService.findAllByFlightEqualsAndUserEquals(
				flightService.getFlightById(flightId), userService.getUserById(userIdSingle));
		model.addAttribute("passengers", passengers);
		model.addAttribute("flightId", flightId);
		return "customerPassengers";
	}

	@RequestMapping(value = "/customer/passenger/edit/{passengerId}/{flightId}", method = RequestMethod.GET)
	public String editPassenger(@PathVariable("passengerId") long passengerId, @PathVariable("flightId") long flightId,
			Model model) {
		Passenger passenger = passengerService.getPassengerById(passengerId);
		model.addAttribute("flightId", flightId);
		model.addAttribute("passenger", passenger);
		passengerService.deletePassengerById(passengerId);
		return "customerEditPassenger";
	}

	@RequestMapping(value = "/customer/booking/passenger/delete/{passengerId}/{flightId}", method = RequestMethod.GET)
	public String deleteBookingPassenger(@PathVariable("passengerId") long passengerId,
			@PathVariable("flightId") long flightId, Model model) {
		passengerService.deletePassengerById(passengerId);
		List<Passenger> passengers = passengerService.findAllByFlightEqualsAndUserEquals(
				flightService.getFlightById(flightId), userService.getUserById(userIdSingle));
		Flight flight = flightService.getFlightById(flightId);
		model.addAttribute("flight", flight);

		model.addAttribute("passengers", passengers);
		return "customerBookingPage";
	}

	@RequestMapping(value = "/customer/passenger/delete/{passengerId}/{flightId}", method = RequestMethod.GET)
	public String deletePassenger(@PathVariable("passengerId") long passengerId,
			@PathVariable("flightId") long flightId, Model model) {
		passengerService.deletePassengerById(passengerId);
		List<Passenger> passengers = passengerService.findAllByFlightEqualsAndUserEquals(
				flightService.getFlightById(flightId), userService.getUserById(userIdSingle));
		Flight flight = flightService.getFlightById(flightId);
		model.addAttribute("flight", flight);

		model.addAttribute("passengers", passengers);
		return "customerPassengers";
	}

	@GetMapping("/customer/booking/confirmed")
	public String showConfirmationPage() {
		return "customerBookingConfirmationPage";
	}

	@GetMapping("/admin/login")
	public String showAdminLoginPage() {
		return "login";
	}

	@GetMapping("/admin/home")
	public String showAdminPage() {
		return "adminPage";
	}

	@GetMapping("/admin/flights/{username}")
	public String showAdminFlightsList(@PathVariable("username") String username, Model model) {
		userIdSingle = userService.getUserByUsername(username).getUserId();
		List<Flight> flight = flightService.getAllFlights();
		model.addAttribute("flight", flight);
		return "adminFlights";
	}

	@GetMapping("/admin/flight/new/{username}")
	public String showNewFlightPage(@PathVariable("username") String username, Model model) {
		userIdSingle = userService.getUserByUsername(username).getUserId();
		model.addAttribute("flight", new Flight());
		return "adminNewFlight";
	}

	@PostMapping("/admin/flight/new")
	public String saveFlight(@ModelAttribute("flight") Flight flight,
			@RequestParam("departureAirport") String departureAirport,
			@RequestParam("destinationAirport") String destinationAirport,
			@RequestParam("arrivalTime") String arrivalTime, @RequestParam("departureTime") String departureTime,
			@RequestParam("departureDate") String deptDate, @RequestParam("departureDate") String arrDate,
			@RequestParam("flightCharge") double flightCharge, Model model) {

		
		if (departureAirport == destinationAirport) {
			model.addAttribute("sameAirportError", "Departure and destination airport can't be same");
			model.addAttribute("flight", new Flight());
			return "adminNewFlight";
		}

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate departureDate = LocalDate.parse(deptDate, formatter);
		LocalDate arrivalDate = LocalDate.parse(arrDate, formatter);

		flight.setDepartureAirport(departureAirport);
		flight.setDestinationAirport(destinationAirport);
		flight.setDepartureTime(departureTime);
		flight.setArrivalTime(arrivalTime);
		flight.setDepartureDate((LocalDate) departureDate);
		flight.setArrivalDate(arrivalDate);
		flight.setFlightCharge(flightCharge);
		flightService.saveFlight(flight);

		List<Flight> flightList = flightService.getAllFlights();
		model.addAttribute("flight", flightList);
		return "adminFlights";
	}

	@RequestMapping(value = "/admin/flight/delete/{flightId}", method = RequestMethod.GET)
	public String deleteFlight(@PathVariable("flightId") long flightId, Model model) {
		flightService.deleteFlightById(flightId);
		List<Flight> flightList = flightService.getAllFlights();
		model.addAttribute("flight", flightList);
		return "adminFlights";
	}

	@RequestMapping(value = "/admin/passengers/{flightId}", method = RequestMethod.GET)
	public String showAdmninPassengerList(@PathVariable("flightId") long flightId, Model model) {
		List<Passenger> passengers = flightService.getFlightById(flightId).getPassengers();
		model.addAttribute("passengers", passengers);
		model.addAttribute("flight", flightService.getFlightById(flightId));
		return "adminPassengers";
	}

}