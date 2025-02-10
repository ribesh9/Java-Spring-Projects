<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
  <%@include file="login.css" %>
	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/
	6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIf
	tl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="
	no-referrer" />
	<title>Login</title>
</head>
<body>
<div class="navigation">
	<div class="logo">
		
	</div>
	<div class="content">
			<ul class="var">
				<li><a href="home" class="home">Home</a></li>
				<li><a href="" class="home">About</a></li>
				<li><a href="login" class="home">Login</a></li>
				<li><a href="#" class="search"><input type="text"></a></li>
				<li><a href="#" class="iscr"><i class="fa-solid fa-magnifying-glass"></i></a></li>
			</ul>
		</div>
</div>
<div class="form">
	<form method="post" action="login">
		<h1>Log In</h1>
		<div class="input">
				Username:
				<input type="text" name="username" placeholder="username" class="name">
		</div>
		<div class="input">		
				Password:
				<input type="password" name="password" placeholder="password" class="cid">
		</div>	
	
		${msg}
		<a href="forgotpassword">Forgot Password?</a>
				<input type="Submit" name="Submit" class="sb" value="Login">

	</form>
</div>
</body>
</html>