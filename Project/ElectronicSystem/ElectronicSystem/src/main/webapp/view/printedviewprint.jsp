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
    </style>
</head>
<body>
<table>
<tr>
	<th>S.No.</th>
    <th>Customer ID</th>
    <th>Customer Name</th>
    <th>Area Number</th>
</tr>
<%int i = 0; %>
<c:forEach var="printed" items="${printed}">
<%i++; %>
	<tr>
		<td><%=i %></td>
		<td>${printed.id }</td>
		<td>${printed.name }</td>
		<td>${printed.area_no }</td>
	</tr>
</c:forEach>
</table>
<%@include file="printingdash.jsp" %>
</body>
</html>