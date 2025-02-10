<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<style>
		*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
		.navbar{
	width: 1200px;
	height: 75px;
	margin: auto;
	background-color: blue;
	opacity: 80%;
}
.icon{
	width: 235px;
	height: 75px;
	float: left;
}
.logo{
	color: orange;
	float: left;
	padding-left: 10px;
	margin-top: 13px;
}
.menu{
	width: 400px;
	height: 70px;
	float: left;
}
ul{
	float: left;
	display: flex;
	justify-content: center;
	align-content: center;
}
li{
	list-style: none;
	margin-left: 60px;
	margin-top: 26px;
	font-size: 25px;
}
li a{
	text-decoration: none;
	color: white;
	font-weight: bold;
	
}
li a:hover{
	color:palegoldenrod;
}


	</style>
</head>
<body>
	<div class="navbar">
		<div class="logo"><h1>Online Gurukul</h1></div>
		<div class="Menu">
			<ul>
				<li><a herf="#">Home</a></li>
				<li><a herf="#">Course</a></li>
				<li><a herf="#">About us</a></li>
			</ul>
		</div>
		
	</div>
</body>
</html>