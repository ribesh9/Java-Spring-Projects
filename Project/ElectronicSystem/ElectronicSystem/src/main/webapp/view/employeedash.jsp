<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kathmandu Water</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1
	/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style type="text/css">
	<%@include file="DashboardAdmin.css" %>
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="sidebar">
	<div class="dashlogo">
	<h3>Employee Panel</h3>
	<ul class="menu">	
		
		<li>
		<a href="registerviewemp">
		<i class="fa-solid fa-id-card">
			<span>Register Customer</span>
			</i>
		</a>
		</li>
		
		<li>
		<a href="listofcustomers">
		<i class="fa-solid fa-list">
			<span>List of customer</span>
			</i>
		</a>
		</li>
		
		<li>
		<a href="pendingViewforemp">
		<i class="fa-solid fa-print">
			<span>Pending Printing</span>
			</i>
		</a>
		</li>
		
		<li>
		<a href="printedviewemp">
		<i class="fa-solid fa-print">
			<span>Printed Result</span>
			</i>
		</a>
		</li>
		
		<li class="logout">
		<a href="logout" ><i class="fa-solid fa-right-from-bracket">
			<span>Logout</span></i>
		</a>
		
		</li>
		
	</ul>
	</div>
	
</div>
<div id="content">
	
</div>
</body>
</html>