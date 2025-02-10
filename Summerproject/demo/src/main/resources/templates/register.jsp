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
        <div class="row">
            <div class="col-25">Full Name</div>
            <div class="col-75">
                <input type="text" name="fullname" placeholder="Your name..">
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
                <input type="text" name="email" placeholder="Your user name..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">Contact</div>
            <div class="col-75">
                <input type="text" name="contact" placeholder="Your contact number...">
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
                <input type="password" name="confirmPassword" placeholder="Your confirm Password..">
            </div>
        </div>

        <div class="row">
            <input type="submit" value="Register">
        </div>
    </form>
</div>

</body>
</html>

