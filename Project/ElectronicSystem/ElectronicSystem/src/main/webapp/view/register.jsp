<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="crt" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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

<%@include file="dashboardadmin.jsp" %>
<div class="form">
	<form method="post" name="form" action="register">
		<h1>Registration</h1>

		<div class="input">
				Name:
				<input type="text" name="name" placeholder="Full-Name" class="name"><p id='n'></p>
		</div>
		<div class="input">		
				Customer ID:
				<input type="text" name="id" placeholder="Customer Id" class="cid">
		</div>
		<div class="input">
				Area Number:
				<input type="text" name="area_no" class="an" placeholder="Area number">
		</div>		
		<p>${msg }</p><br>
				<button type="submit" class="submit" onclick="return validate()">Submit</button>

	</form>
</div>
<script>
    	function validate(){
    		var name = document.form.name.value;
    		const flag=0;
    		var numexp=/[0-9]+$/;
    		var alphaexp=/^[a-zA-Z ]+$/;
    		var id = document.form.id.value;
    		var area = document.form.area_no.value;
    		if(name === ""|| !name.match(alphaexp)) {
    			alert("The username can only be in alphabets!");
    			return false;
    		}
    		else if(!id.match(numexp)){
    			alert("The id must be in numerical form");
    		return false;
    		}
    		else if(!area.match(numexp)){
    			alert("The area must be in numerical form");
    			return false;
    		}
    		return true;
    		
    	}
    </script>
</body>
</html>