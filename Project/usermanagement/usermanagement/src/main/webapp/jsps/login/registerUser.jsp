<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
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

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }

        .col-25 {
            float: left;
            width: 25%;
            margin-top: 6px;
        }

        .col-75 {
            float: left;
            width: 75%;
            margin-top: 6px;
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
</head>
<body>
<h2>User Registration Form</h2>
<div class="container">
    <form action="registerUser" method="post">
        <div class="row">
            <div class="col-25">First Name</div>
            <div class="col-75">
                <input type="text" name="firstName" placeholder="Your name..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Last Name</div>
            <div class="col-75">
                <input type="text" name="lastName" placeholder="Your last name..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">E-mail</div>
            <div class="col-75">
                <input type="text" name="email" placeholder="Your user name..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Password</div>
            <div class="col-75">
                <input type="password" name="password" placeholder="Your password..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Confirm Password</div>
            <div class="col-75">
                <input type="text" name="confirmPassword" placeholder="Your confirm Password..">
            </div>
        </div>

        <div class="row">
            <input type="submit" value="Register">
        </div>
    </form>
</div>

</body>
</html>

