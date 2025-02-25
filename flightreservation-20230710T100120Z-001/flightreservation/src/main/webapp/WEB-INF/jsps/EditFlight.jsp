<html>
<head>
    <title>Create Flight</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();

        } );
        $(document).ready(function(){
            $('#timepicker').timepicker({
                timeFormat: 'HH:mm',
                interval: 15,
                minTime: '0',
                maxTime: '23:59',
                defaultTime: '08:00',
                startTime: '00:00',
                dynamic: true,
                dropdown: true,
                scrollbar: true
            });
        });
    </script>
</head>
<body>

<h1>Create Flight</h1>
<form action="SaveFlight" method="post">
    <input type="hidden" name="id" value="${flight.id}"/>
    <table>
        <tr>
            <td>Flight Number: </td>
            <td><input type="text" name="flightNumber" value="${flight.flightNumber}"></td>
        </tr>

        <tr>
            <td>Airlines: </td>
            <td><input type="text" name="operatingAirlines" type="${flight.operatingAirlines}"></td>
        </tr>
        <tr>
            <td>Departure City: </td>
            <td><input type="text" name="departureCity" value="${flight.departureCity}"></td>
        </tr>
        <tr>
            <td>Arrival City: </td>
            <td><input type="text" name="arrivalCity" value="${flight.arrivalCity}"></td>
        </tr>
        <tr>
            <td>Departure Date: </td>
            <td><input type="text" id="datepicker" name="dateOfDeparture" value="${flight.dateOfDeparture}"></td>
        </tr>
        <tr>
            <td>Estimated Departure Time: </td>
            <td><input type="text" id="timepicker" name="estimatedDepartureTime" value="${flight.estimatedDepartureTime}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Save Flight"></td>
        </tr>

    </table>
</form>

</body>
</html>