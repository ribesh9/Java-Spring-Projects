<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1
	/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
		*{
		margin: 0;
		padding:0;
		box-sizing: border-box;
		font-family: Times new roman;
		list-style: none;
	}
	h1{
		margin-left:556px;
	}
	form input {
    	margin-left: 10px;
    	height: 25px;
    	margin-bottom: 10px;
    	border:1px solid black;
    	border-radius:10px;
    	text-align:center;
	}
	form {
    	height: 330px;
    	padding: 20px;
    	align-content: center;
    	text-align: center;
    	margin-left:500px;
    	width: 347px;
    height: 258px;
    border-radius: 10px;
    	background:url("/view/waterdroplets.jpg");
	}
	</style>
<title>Kathmandu Water</title>
</head>
<body>
<h1>Edit Employee</h1>
<%@include file="dashboardadmin.jsp" %>
<form action="saveemployee" method="post" name="form">
    <input type="hidden" name="id" value="${employee.id}"/>
    <table>
        <tr>
            <td>Name </td>
            <td><input type="text" name="name" value="${employee.name}"></td>
        </tr>

        <tr>
            <td>Email </td>
            <td><input type="text" name="email" value="${employee.email}"></td>
        </tr>
        <tr>
            <td>Phone </td>
            <td><input type="text" name="phone" value="${employee.phone}"></td>
        </tr>
        <tr>
            <td>User Name </td>
            <td><input type="text" name="username" value="${employee.username}"></td>
        </tr>
        <tr>
            <td>Password </td>
            <td><input type="text" name="password" value="${employee.password}"></td>
        </tr>
        <tr>
        <td>${msg}</td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit" onclick="return validate()">Save</button></td>
        </tr>

    </table>
</form>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
</body>
</html>