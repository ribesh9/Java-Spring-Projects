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
    <th>Email</th>
    <th>Password</th>
</tr>
<c:forEach var="admins" items="${admin }">
	<tr>
		<td>${admins.id }</td>
		<td>${admins.email }</td>
		<td>${admins.password }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>