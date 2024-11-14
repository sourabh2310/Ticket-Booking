<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>New User Form</title>

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
	<div>

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-8 col-md-offset-2 col-md-8 col-md-offset-2">

			<div class="panel panel-primary">

				<div class="panel-heading" style="background-color: #124512">
					<div class="panel-title">Register New User</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Registration Form -->
					<form:form
						action="${pageContext.request.contextPath}/customer/processRegistrationForm"
						modelAttribute="user" method="post" class="form-horizontal">

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

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>

							<form:input path="username" placeholder="username"
								class="form-control" required="true" pattern="[a-zA-Z0-9]{1,}"
								autocomplete="off"/>
						</div>

						<!-- Password -->
						<i>Password must include a upper case letter, a lower case
							letter and a digit.</i>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span>

							<form:password path="password" placeholder="password"
								class="form-control" required="true" pattern="[a-zA-z0-9]{8,}"
								autocomplete="off"/>
						</div>

						<!-- First name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>

							<form:input path="firstname" placeholder="First-Name"
								class="form-control" required="true" pattern="[a-zA-Z]{1,}"
								autocomplete="off"/>
						</div>

						<!-- Last name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>

							<form:input path="lastname" placeholder="Last-Name"
								class="form-control" required="true" pattern="[a-zA-Z]{1,}"
								autocomplete="off"/>
						</div>

						<!-- Email -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span>

							<form:input type="email" path="email" placeholder="Email" class="form-control"
								required="true" autocomplete="off"/>
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-phone"></i></span>

							<form:input path="phone" placeholder="Phone Number"
								class="form-control" required="true" pattern="[0-9]{10}"
								autocomplete="off"/>
						</div>




						<!-- Register Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-primary"
									style="color: white; background-color: #124512">Register</button>
							</div>
						</div>

						<div>
							<a href="${pageContext.request.contextPath}/start"
								class="btn btn-primary" role="button" aria-pressed="true"
								style="color: white; background-color: #124512">Back To Home</a>
						</div>

					</form:form>

				</div>

			</div>

		</div>

	</div>

</body>
</html>