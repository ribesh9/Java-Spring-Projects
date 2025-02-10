<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Save Flight Form</h3>
<form action="saveFlight" method="post">
<pre>
		Flight Number 			  : <input type="text" name="flightNumber" >
		Operating Airlines  	  : <input type="text" name="operatingAirlines">
		Departure City			  : <input type="text" name="departureCity">
		Arrival City			  : <input type="text" name="arrivalCity">
		Date of Departure   	  : <input type="text" name="dateOfDeparture" id="datepicker">
		Estimated Departure Time  : <input type="text" name="estimatedDepartureTime" id="timepicker">
		
		
				<input type="submit" name="submit" value="Save">

</pre>





</form>

</body>
</html>