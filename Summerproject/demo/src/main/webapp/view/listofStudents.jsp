
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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
<tr th:each ="std:${std }">
	<td th:text="${std.fullnaame }"></td>
</tr>
</table>
</body>
</html>