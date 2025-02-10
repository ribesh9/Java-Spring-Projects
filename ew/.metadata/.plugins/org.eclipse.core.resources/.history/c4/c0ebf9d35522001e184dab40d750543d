<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <title>Flight List</title>
    <style>
        table{
            row-span: 75;
        }
        td{
            height: 40px;
        }
        th{
            background-color: deepskyblue;
        }
    </style>
</head>
<body>
<h1>Flight List</h1>
<a href="createFlight"><h3>Create Flight</h3></a>
<table>
<tr>
    <th>ID</th>
    <th>Airlines</th>
    <th>Departure City</th>
    <th>Arrival City </th>
    <th>Departure Date</th>
    <th>Estimated Departure Time</th>
    <th>Action</th>
</tr>

<c:forEach var="flight" items="${flights}">
    <tr>
        <td>${flight.id}</td>
        <td>${flight.flightNumber}</td>
        <td>${flight.operatingAirlines}</td>
        <td>${flight.departureCity}</td>
        <td>${flight.arrivalCity}</td>
        <td>${flight.dateOfDeparture}</td>
        <td>${flight.estimatedDepartureTime}</td>
        <td>
            <a href="EditFlight?id=${flight.id}">Edit</a>
            <a href="DeleteFlight?id=${flight.id}">Delete</a>
        </td>
    </tr>

</c:forEach>
</table>
</body>
</html>