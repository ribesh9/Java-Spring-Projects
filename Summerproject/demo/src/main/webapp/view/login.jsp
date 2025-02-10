<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
         <%@include file="login.css" %>
    </style>
</head>
<body>
<div class="container">
<h2>User Login</h2>
    <form action="login" method="post">
        <div class="row">
            <div class="col-25">
                E-mail
            </div>
            <div class="textfield">
                <input type="text" name="email" placeholder="Enter your email..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                Password
            </div>
            <div class="textfield">
                <input type="password" width="280px" name="password" placeholder="Enter your Password..">
            </div>
        </div>
        <div class="login">
            <input type="submit" value="Login" class="log">
        </div>
        ${msg}
    </form>
</div>

</body>
</html>

