<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1
	/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> -->
<title>Kathmandu Water</title>

<style type="text/css">
	*{
		margin: 0;
		padding:0;
		box-sizing: border-box;
		font-family: Times new roman;
		list-style: none;
	}
	table{
		padding:20px;
		margin:20px;
	}
	.list{
			margin-left:500px;
			margin-top: 110px
			
	}
	.table {
    	width: 500px;
    	align-content: center;
    	border: 1px solid;
    	height: 369px;
    	width: 427px;
    	/* align-content: center; */
    	text-align: center;
    	background:url("/view/waterdroplets.jpg");
	}
	form input {
    	margin-left: 10px;
    	height: 25px;
    	margin-bottom: 10px;
    	border:1px solid black;
    	border-radius:10px;
	}
	form {
    	height: 330px;
    	padding: 20px;
    	align-content: center;
    	/* text-align: center; */
	}
	
</style>
</head>
<body>
<div class="list">
	<div class="table">
<h1>Add Employee</h1>
<form method="post" name="form" action="saveemp">
    <table>
  
        <tr>
            <td>Name </td>
            <td><input type="text" name="name" required></td>
        </tr>

        <tr>
            <td>Email </td>
            <td><input type="text" name="email" required></td>
        </tr>
        <tr>
            <td>Phone </td>
            <td><input type="text" name="phone" required></td>
        </tr>
        <tr>
            <td>User Name </td>
            <td><input type="text" name="username" required></td>
        </tr>
        <tr>
            <td>Password </td>
            <td><input type="text" name="password" required></td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td></td>
            <td class="submit"><button type="submit" onclick="return validate()">Save Employee</button></td>
        </tr>
    </table>
    
    
    
</form>
</div>
</div>
<script>
    	function validate(){
    		var name = document.form.name.value;
    		var email = document.form.email.value;
    		var phone = document.form.phone.value;
    		var username = document.form.username.value;
    		var password = document.form.password.value;
    		var emailexp =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    		var phoneexp= /^98[0-9]{8}$/;
    		var namexp =/^[a-zA-Z ]+$/;
    		var usernameexp=/^[a-zA-Z]+$/;
    		
    		if(!name.match(namexp)){
    			alert("Name must be in alphabets");
    			return false;
    		}
    		else if(!email.match(emailexp)){
    			alert("Email invalid");
    			return false;
    		}
    		else if(!phone.match(phoneexp)){
    			alert("Invalid phone number");
    			return false;
    		}
    		else if(!username.match(usernameexp)||username.length<3){
    			alert("The username must be alphabets and minimum 3 characters with no space");
    			return false;
    		}
    		else if(password.length<8){
    			alert("The password must consist of minimum 8 characters");
    			return false;
    		}
    		return true;
    		
    	}
    </script>
 <%@include file="dashboardadmin.jsp" %>
</body>
</html>