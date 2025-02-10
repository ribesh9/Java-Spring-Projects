<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        <%@include file="register.css" %>
    </style>
</head>
<body>

<div class="container">
<h2>Student Registration Form</h2>
    <form action="registerUser" method="post">
    <input type="hidden" name="id" value="${flight.id}">
        <div class="row">
            <div class="col-25">Full Name</div>
            <div class="col-75">
                <input type="text" name="fullname" value="${std.fullname}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Select Course</div>
            <div class="col-75">
                <select name="course">
                	<option value="Java">Java</option>
                	<option value="Python">Python</option>
                	<option value="PHP">PHP</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-25">E-mail</div>
            <div class="col-75">
                <input type="text" name="email" value="${std.email}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Contact</div>
            <div class="col-75">
                <input type="text" name="contact" value="${std.contact}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Password</div>
            <div class="col-75">
                <input type="text" name="password" value="${std.password}">
            </div>
        </div>

        <div class="row">
            <input type="submit" value="Register">
        </div>
    </form>
</div>

</body>
</html>

