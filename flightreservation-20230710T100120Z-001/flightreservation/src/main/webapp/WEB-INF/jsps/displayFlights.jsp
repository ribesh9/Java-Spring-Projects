<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        i
        {
            font-color:#000000;
        }
    </style>
</head>
<body>

<h2>Flight Details</h2>

<table>
    <tr>
        <th>Airlines</th>
        <th>Departure City</th>
        <th>Arrival City</th>
        <th>Departure Time</th>
        <th>Choose Flight</th>
    </tr>

    <c:forEach items="${flights}" var="flight">
        <tr>
            <td>${flight.operatingAirlines}</td>
            <td>${flight.departureCity}</td>
            <td>${flight.arrivalCity}</td>
            <td>${flight.dateOfDeparture}</td>
            <td><a href="showCompleteReservation?flightId=${flight.id}">Select</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

