<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }

        select {
            float: left;
            width: 50%;
            margin-top: 20px;
            height:40px;
            font-size: 18px;
        }
        input[type=text]{
            width: 50%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }
        input[type=password]{
            width: 50%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: left;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        .col-75 {
            float: left;
            width: 50%;
            margin-top: 20px;
        }

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }

        .col-25 {
            float: left;
            width: 25%;
            margin-top: 20px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
            .col-25, .col-75, input[type=submit] {
                width: 100%;
                margin-top: 0;
            }
        }
    </style>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();

        } );
    </script>
</head>
<body>
<h2>Find Flights</h2>
<div class="container">
    <form action="FindFlights" method="post">
        <div class="row">
            <div class="col-25">From</div>
            <div class="col-75">
                <select name="from">
               <c:forEach var="flight" items="${flightList}">
                    <option value="${flight.departureCity}}">
                            ${flight.departureCity}
                    </option>
                </c:forEach>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-25">To</div>
            <div class="col-75">
                <select name="from">
                    <c:forEach var="flight" items="${flightList}">
                        <option value="${flight.arrivalCity}}">
                                ${flight.arrivalCity}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-25">Departure Date</div>
            <div class="col-75"><input type="text" id="datepicker" name="dateOfDeparture"></div>
        </div>

<div class="row">
    <div class="col-25"></div>
    <div class="col-75">
    <input type="submit" value="Search"></div>
    </div>
    </form>
</div>

</body>
</html>

