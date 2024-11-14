<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Book Flight</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid"
		style="color: white; background-color: #124512">
		<div class="navbar-header">
			<p class="navbar-brand"
				style="color: white; background-color: #124512; font-size: 25px"
				><b>COGNIZANT</b></p>
		</div>
		<ul class="nav navbar-nav">
			<li ><a
				style="color: white; background-color: #124512;; font-size: 18px"
				href="${pageContext.request.contextPath}/"><b>HOME</b></a></li>

			<li><a
				style="color: white; background-color: #124512; font-size: 18px"
				href="${pageContext.request.contextPath}/customer/flight/search/<security:authentication property="principal.username"/>"><b>Search
						Flight</b></a></li>
			<li><a
				style="color: white; background-color: #124512; font-size: 18px"
				href="${pageContext.request.contextPath}/customer/flights/<security:authentication property="principal.username"/>"><b>View
						Bookings</b></a></li>
		</ul>


		<ul class="nav navbar-nav">
			<security:authorize access="hasRole('ADMIN')">
				<li><a
					style="color: white; background-color: #124512; font-size: 18px"
					href="${pageContext.request.contextPath}/admin/flights/<security:authentication property="principal.username"/>"><b>View
							Flights</b></a></li>
				<li><a
					style="color: white; background-color: #124512; font-size: 18px"
					href="${pageContext.request.contextPath}/admin/flight/new/<security:authentication property="principal.username"/>"><b>Add
							Flights</b></a></li>


			</security:authorize>
		</ul>

		<ul class="nav navbar-nav navbar-right">

			<li><form:form
					action="${pageContext.request.contextPath}/logout" method="POST"
					class="form-horizontal">
					<!-- Register Button -->
					<div style="margin: 15px" class="form-group">
						<div class="col-sm-6 controls">
							<button type="submit" class="btn btn-primary"
								style="color: white; background-color: #124512; font-size: 15px">Logout</button>
						</div>
					</div>
				</form:form></li>
		</ul>

	</div>


	</nav>

	<div class="container">
		<div style="color: white; background-color: #124512" class="jumbotron">
			<h1>COGNIZANT E-TICKETING</h1>
			<p>Travel With Us</p>
		</div>
	</div>
	<div align="center">
		<table border="1" class="table table-bordered">
			<caption style="color: black; text-align: center">
				<b>LIST OF FLIGHTS</b>
			</caption>
			<thead>
				<tr style="color: white; background-color: #124512">
					<th>Flight No</th>
					<th>Departure Airport</th>
					<th>Destination Airport</th>
					<th>Departure Date</th>
					<th>Arrival Date</th>
					<th>Departure Time</th>
					<th>Arrival Time</th>
					<th>Flight Charge</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach var="flightList" items="${flight}">
				<tbody>
					<tr>
						<td>${flightList.flightNumber}</td>
						<td>${flightList.departureAirport}</td>
						<td>${flightList.destinationAirport}</td>
						<td>${flightList.departureDate}</td>
						<td>${flightList.arrivalDate}</td>
						<td>${flightList.departureTime}</td>
						<td>${flightList.arrivalTime}</td>
						<td>${flightList.flightCharge}</td>
						<td><a
							href="${pageContext.request.contextPath}/customer/bookingPage/${flightList.flightId}"><button
									type="button" class="btn btn-outline-danger btn-sm"
									style="color: white; background-color: #124512">Book
									Flight</button></a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<hr>
		<div>
			<a
				href="${pageContext.request.contextPath}/customer/flight/search/<security:authentication property="principal.username"/>"
				class="btn btn-primary" role="button" aria-pressed="true"
				style="color: white; background-color: #124512">Back To Search</a>
		</div>
	</div>
</body>
</html>