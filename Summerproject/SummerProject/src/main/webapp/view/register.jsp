<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1
	/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
  <%@include file="register.css" %>
	</style>
</head>
<body>
	<div class="navigation">
	<div class="logo">
		
	</div>
	<div class="content">
			<ul class="var">
				<li><a href="home" class="home">Home</a></li>
				<li><a href="#" class="home">About</a></li>
				<li><a href="#" class="home">${name}</a></li>
				<li><a href="#" class="search"><input type="text"></a></li>
				<li><a href="#" class="iscr"><i class="fa-solid fa-magnifying-glass"></i></a></li>
			</ul>
		</div>
</div>

<div class="form">
	<form method="post" action="register">
		<h1>Registration</h1>
		<div class="input">
				Name:
				<input type="text" name="name" placeholder="Full-Name" class="name">
		</div>
		<div class="input">		
				Customer ID:
				<input type="text" name="customer_id" placeholder="Customer Id" class="cid">
		</div>
		<div class="input">
				Area Number:
				<input type="text" name="area_no" class="an" placeholder="Area number">
		</div>		${msg}
				<input type="Submit" name="Submit" class="sb">

	</form>
</div>
</body>
</html>