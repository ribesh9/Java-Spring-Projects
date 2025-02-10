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
    <th>Full Name</th>
    <th>Email</th>
    <th>Contact</th>
    <th>Course</th>
</tr>
<c:forEach var="student" items="${admin }">
	<tr>
		<td>${student.id }</td>
		<td>${student.fullname }</td>
		<td>${student.email }</td>
		<td>${student.contact }</td>
		<td>${student.course }</td>
		<td><a href="Editstd?id=${student.id }&email=${student.email}">Edit</a></td>
		<td><a href="Deletestd?id=${student.id }">Delete</a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>