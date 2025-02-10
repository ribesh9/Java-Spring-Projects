<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kathmandu Waters</title>
 <style>
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
    		height: 392px;
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
<%@include file="dashboardadmin.jsp" %>

<table>
{msg}
<tr>
	<th>S.No.</th>
    <th>Customer ID</th>
    <th>Customer Name</th>
    <th>Area Number</th>
  
</tr>
<%int i = 0; %>
<c:forEach var="customer" items="${customers}">
<%i++; %>
	<tr>
		<td><%=i %></td>
		<td>${customer.id }</td>
		<td>${customer.name }</td>
		<td>${customer.area_no }</td>
		
	</tr>
</c:forEach>
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