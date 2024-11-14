<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Registrarion Confirmation</title>

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
					style="color: white; background-color: #124512; font-size: 18px"
					href="${pageContext.request.contextPath}/start"><b>HOME</b></a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/customer/login" style="color: white"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<li><a href="/customer/signUp" style="color: white"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div style="color: white; background-color: #124512" class="jumbotron">
			<h1>COGNIZANT E-TICKETING</h1>
			<p>Travel With Us</p>
		</div>
	</div>
	<hr>

	<div class="alert alert-success" role="alert">
		<h6>User registered successfully!</h6>
	</div>


	<hr>
	<div class="col-sm-6 controls">
		<a href="${pageContext.request.contextPath}/customer/login">
			<button type="submit" class="btn btn-primary"
				style="background-color: green">Go to Login page</button>
		</a>
	</div>
</body>

</html>