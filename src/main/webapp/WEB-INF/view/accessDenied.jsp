<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
	<title> Access-denied Page</title>
</head>

<body>
	<h2>COGNIZANT ACCESS DENIED</h2>
	<hr>
	<p>
	Access-denied...You are not authorized to access this page
	
	<hr>
	
	
	<a href="${pageContext.request.contextPath}/customer/home">Go to Home Page</a>
</body>

</html>