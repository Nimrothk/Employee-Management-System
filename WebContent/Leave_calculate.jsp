<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login as Admin</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

</head>
<body>


	<div class="container-login100"
		style="background-image: url('images/bg-img.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form" method="post"
				action="Leave_calc">
				<span class="login100-form-title p-b-37"> Calculate Leave
					Days </span> Leave From:
				<div class="wrap-input100 validate-input m-b-20"
					data-validate="Enter Leave From">
					<input class="input100" type="date" name="from"
						placeholder="Leave From"> <span class="focus-input100"></span>
				</div>
				Leave To:
				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Leave To">
					<input class="input100" type="date" name="to"
						placeholder="Leave To"> <span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">

					<p style="color: red;">

						<%
							String error = (String) session.getAttribute("error");
							if (null == error) {
								out.println("<br>");
							} else
								out.println(error);
							session.setAttribute("error", null);
						%>
					</p>
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn">Save</button>
				</div>
			</form>
		</div>
	</div>



	<div id="dropDownSelect1"></div>


	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main.js"></script>

</body>
</html>