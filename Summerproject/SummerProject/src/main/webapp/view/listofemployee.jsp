<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style>
        table{
            row-span: 75;
        }
        td{
            height: 40px;
        }
        th{
            background-color: deepskyblue;
        }
    </style>
</head>
<body>
<table>
<tr>
    <th>ID</th>
    <th>Employee Name</th>
    <th>Username</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Password</th>
</tr>
<c:forEach var="employee" items="${employee }">
	<tr>
		<td>${employee.id }</td>
		<td>${employee.name }</td>
		<td>${employee.username }</td>
		<td>${employee.email }</td>
		<td>${employee.phone }</td>
		<td>${employee.password }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>