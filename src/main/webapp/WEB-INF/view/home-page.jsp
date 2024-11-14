<!DOCTYPE html>
<html>

<head>
<title>Ticket Booking</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<style>
body {
	background-image: url(img/airplane.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

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
					style="color: white; background-color: #124512; font-size: 18px"
					href="${pageContext.request.contextPath}/start"><b>HOME</b></a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/customer/login"
					style="color: white; background-color: #124512"><span
						class="glyphicon glyphicon-log-in"></span> <b>Login</b></a></li>
				<li><a
					href="${pageContext.request.contextPath}/customer/signUp"
					style="color: white; background-color: #124512"><span
						class="glyphicon glyphicon-user"></span><b> Sign Up</b></a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div style="color: white; background-color: #124512" class="jumbotron">
			<h1>COGNIZANT E-TICKETING</h1>
			<p>Travel With Us</p>
		</div>
	</div>
</body>

</html>