<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Add new flight</title>

<meta charset="utf-8">
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
					style="color: white; background-color: #124512; font-size: 25px">
					<b>COGNIZANT</b>
				</p>
			</div>
			<ul class="nav navbar-nav">
				<li><a
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

	<div id="loginbox" style="margin-top: 50px;"
		class="mainbox col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">

		<div class="panel panel-primary">

			<div class="panel-heading"
				style="color: white; background-color: #124512">
				<div class="panel-title">Add New Flight</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<!-- Registration Form -->
				<form:form
					action="${pageContext.request.contextPath}/admin/flight/new"
					modelAttribute="flight" method="POST" class="form-horizontal">

					<!-- Place for messages: error, alert etc ... -->
					<div class="form-group">
						<div class="col-xs-15">
							<div>

								<!-- Check for registration error -->
								<c:if test="${registrationError != null}">

									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										${registrationError}</div>

								</c:if>

							</div>
						</div>
					</div>




					<!-- need to associate the data with id -->
					<!-- Students Name -->
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Flight Number</span>
						<form:input path="flightNumber" placeholder="Flight Number"
							class="form-control" required="true"
							autocomplete="off" />
					</div>

					<!-- Father's Name -->
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Departure Airport</span>
						<form:input path="departureAirport"
							placeholder="Departure Airport" class="form-control"
							required="true" pattern="[a-zA-Z]{1,}" autocomplete="off" />
					</div>

					<!-- Date of Birth -->
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Destination Airport</span>
						<form:input path="destinationAirport"
							placeholder="Destination Airport" class="form-control"
							required="true" pattern="[a-zA-Z]{1,}" autocomplete="off" />
					</div>


					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Departure Date</span>
						<form:input type="date" path="departureDate"
							placeholder="Departure Date" autocomplete="off"
							class="form-control" required="true" />
					</div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Arrival Date</span>
						<form:input type="date" path="arrivalDate"
							placeholder="Arrival Date" autocomplete="off"
							class="form-control" required="true" />
					</div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Departure Time</span>
						<form:input type="time" path="departureTime"
							placeholder="Departure Time" class="form-control"
							autocomplete="off" required="true" />
					</div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Arrival Time</span>
						<form:input type="time" path="arrivalTime"
							placeholder="Arrival Time" class="form-control"
							autocomplete="off" required="true" />
					</div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon">Flight Charge</span>
						<form:input path="flightCharge" placeholder="Flight Charge"
							class="form-control" pattern="[0-9.]{1,}" autocomplete="off"
							required="true" onfocus="this.value=''" />
					</div>

					<div style="margin-top: 10px" class="form-group">
						<div class="col-sm-6 controls">
							<button type="submit" class="btn btn-success"
								style="color: white; background-color: #124512">Add
								Flight</button>
						</div>
					</div>

				</form:form>

			</div>

		</div>

	</div>

	</div>
</body>
</html>