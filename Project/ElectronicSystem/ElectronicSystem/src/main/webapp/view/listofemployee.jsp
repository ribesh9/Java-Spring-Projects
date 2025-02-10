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
        table{
            row-span: 75;
            margin-left:370px;
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
    		border-radius: 6px;
		}
       th {
    		background-color: deepskyblue;
   			border: 1px solid;
    		padding: 5px;
		}
    </style>
</head>
<body>
<%@include file="dashboardadmin.jsp" %>
<div class="list">
<table>
<tr>
<th>S.No.</th>
    <th>Employee ID</th>
    <th>Employee Name</th>
    <th>Username</th>
    <th>Email</th>
    <th>Phone</th>
    <th colspan='2'>Action</th>
</tr>
<% int i =1; %>
<c:forEach var="employee" items="${employee }">
	
	<tr>
	<td><%=i %></td>
		<td>${employee.id }</td>
		<td>${employee.name }</td>
		<td>${employee.username }</td>
		<td>${employee.email }</td>
		<td>${employee.phone }</td>
		<td><a href="editemp?id=${employee.id}">Edit</a>
		<a href="deleteemp?id=${employee.id}">Delete</a></td>
	<%i++; %>
	</tr>
	
</c:forEach>
</table>
</div>
</body>
</html>