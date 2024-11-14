<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Passengers</title>

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
		<table border="1" cellpadding="5" class="table table-bordered">
			<caption style="color: black; text-align: center">
				<b>LIST OF PASSENGERS</b>
			</caption>
			<thead>
				<tr style="color: white; background-color: #124512">
					<th>First Name</th>
					<th>Last Name</th>
					<th>Phone Number</th>
					<th>Email</th>
				</tr>
			</thead>
			<c:forEach var="passengerList" items="${passengers}">
				<tbody>
					<tr>
						<td>${passengerList.firstName}</td>
						<td>${passengerList.lastName}</td>
						<td>${passengerList.phoneNumber}</td>
						<td>${passengerList.email}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		${id}
	</div>
</body>
</html>