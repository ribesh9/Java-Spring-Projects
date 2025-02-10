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
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<title>Kathmandu Water</title>
</head>
<body>
<h1>Edit Employee</h1>
<form action="savecus" method="post" name="form">
    
    <table>
    <tr>
    <td>Customer id</td>
    <td><input type="text" name="id" value="${customer.id}" readonly required/></td>
    </tr>
        <tr>
            <td>Name </td>
            <td><input type="text" name="name" value="${customer.name}" required></td>
        </tr>

        <tr>
            <td>Area Number</td>
            <td><input type="text" name="area_no" value="${customer.area_no}" required></td>
        </tr>
       
        <tr>
            <td></td>
            <td><button type="submit" onclick="return validate()"></button>Save</td>
        </tr>

    </table>
</form>
<script>
	function validate(){
		
		var name = document.form.name.value;
		var area = document.form.area_no.value;
		var numberexp = /^[0-9]+$/;
		var namexp =/^[a-zA-Z ]+$/;
		
		if(!name.match(namexp)){
			alert("Invalid name");
			return false;
		}
		else if(!area.match(numberexp)){
			alert("Invalid area number");
			return false;
		}
		return true;
	}
</script>
</body>
</html>