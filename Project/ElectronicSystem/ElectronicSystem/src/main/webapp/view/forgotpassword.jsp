<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Forgot Password</h1>
<form action="validateemail" method="post" name="form">
    ${msg }
    <table>
        <tr>
            <td>Name </td>
            <td><input type="text" name="email" required></td>
        </tr>
              
        <tr>
            <td></td>
            <td><button type="submit" onclick="return validate()"></button>Next</td>
        </tr>

    </table>
</form>
</body>
</html>