<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Search flight</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


</head>

<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="color: white; background-color: #124512">
			<div class="navbar-header">
				<p class="navbar-brand" style="color: white; background-color: #124512; font-size: 25px"
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

	<div>

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">

			<div class="panel panel-primary">

				<div class="panel-heading" style="color: white; background-color: #124512">
					<div class="panel-title">BOOK FLIGHT</div>
				</div>
				<b></b>

				<div style="padding-top: 30px" class="panel-body">

					<form:form
						action="${pageContext.request.contextPath}/customer/flight/search"
						modelAttribute="flight" method="POST" class="form-horizontal">

						<!-- Place for messages: error, alert etc ... -->
						<div class="form-group">
							<div class="col-xs-15">
								<div>

									<c:if test="${AirportError != null}">

										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${AirportError}</div>

									</c:if>

									<c:if test="${notFound != null}">

										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${notFound}</div>

									</c:if>



								</div>
							</div>
						</div>






						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon">Departure Airport</span>
							<form:select path="departureAirport" class="form-control">
								<c:forEach var="departureAirport"
									items="${departureAirportList}">
									<form:option value="${departureAirport}"
										label="${departureAirport}" />
								</c:forEach>
							</form:select>
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon">Destination Airport</span>
							<form:select path="destinationAirport" class="form-control">
								<c:forEach var="destinationAirport"
									items="${destinationAirportList}">
									<form:option value="${destinationAirport}"
										label="${destinationAirport}" />
								</c:forEach>
							</form:select>
						</div>


						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon">Departure Date</span>
							<form:input type="date" path="departureDate"
								placeholder="Departure Date" class="form-control"
								required="true" />
						</div>


						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success" style="color: white; background-color: #124512">Search</button>
							</div>
						</div>

					</form:form>



				</div>

			</div>

		</div>

	</div>
</body>
</html>