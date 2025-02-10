<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kathmandu Waters</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1
	/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
 <style>
 *{
	margin: 0;
	padding:0;
	box-sizing: border-box;
	font-family: Times new roman;
	list-style: none;
}
 
 .var li{
	display: inline-block;
}
 
 .content{
	font-size: 28px;
	text-decoration: none;
	float: left;
	margin-top: 0px;
}
.home{
	padding: 30px;
	text-decoration: none;
	}
         table{
            row-span: 75;
            margin-left:420px;
            border: 1px solid;
    		text-align: center;
    		margin-top:100px;
    		border-collapse: collapse;
        }
        
        td{
            height: 40px;
            border: 1px solid;
    		padding: 16px;
        }
        td a {
   			background: deepskyblue;
    		padding: 3px;
    		text-decoration: none;
    		color: aliceblue;
    		font-size: 18px;
    		border-radius: 6px;
		}
       th {
    		background-color: deepskyblue;
   			border: 1px solid;
    		padding: 5px;
		}
		
		.form{
			margin-left: 400px;
    		background: blue;
    		width: 370px;
    		text-align: center;
    		height: 235px;
        	border-radius: 20px;
    		margin-top: 20px
			}
		
		button {
    		padding: 10px;
    		background-color: deepskyblue;
    		border-radius: 10px;
    		width: 184px;
    		margin:18px;
    		/* padding-left: 9px; */
    		/*margin-left: 58px;*/
		}

		.name {
    		padding: 10px;
		}
		
		.input {
    		padding: 10px;
		}
		
		input {
    		border: 2px solid;
    		border-radius: 10px;
    		padding: 5px;
			}
			
    </style>
</head>
<body>
<div class="content">
			<ul class="var">
				<li>
				<a href="home" class="home">
				<i class="fa-solid fa-house">Home</i></a>
				</li>
			</ul>
		</div>
<div class="form">
	<form method="post" name="form" action="search">
		<h1>Search</h1>
		<div class="input">		
				<div class="name">Customer ID:</div>
				<input type="text" name="id" placeholder="Customer Id" class="cid" required><p id='id'></p>
		</div>		
				<button type="submit" onclick="return validate()">submit</button>

	</form>
</div>
<table>

<tr>
    <th>Customer ID</th>
    <th>Customer Name</th>
    <th>Area Number</th>
    <th colspan='2'>State</th>
</tr>
	<tr>

		<td>${customers.id}</td>
		<td>${customers.name}</td>
		<td>${customers.area_no}</td>
		<td>${msg}</td>

	</tr>
</table>

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
    			flag++;
    			return false;
    		}
    		else if(!id.match(numexp)){
    			alert("The id must be in numerical form");
    			flag++;
    		return false;
    		}
    		else if(!area.match(numexp)){
    			alert("The area must be in numerical form");
    			flag++;
    			return false;
    		}
    		else if(flag==0){
    			window.location="redirect:/listofcustomers";
    			return true;
    		}
    		
    	}
    </script>
</body>
</html>