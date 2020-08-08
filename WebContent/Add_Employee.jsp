<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Employees</title>
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

</head>
<body>

	<%@include file="Header_admin.jsp"%>
	</div>
	<div class="col-9">
		<a href="Option.jsp">Home</a> <a class="active"
			href="Add_Employee.jsp">Add Employee</a> <a href="List_Employees.jsp">View
			Employee</a> <a href="Add_Admin.jsp">Add Admin</a> <a
			href="List_Admin.jsp">View Admin</a> <a href="News.jsp">Post
			News</a> <a href="List_News.jsp">List News</a> <a href="Logout"
			class="btn btn-success">Sign Out</a>
	</div>
	</div>
	</div>

	<div class="container-login100"
		style="background-image: url('images/bg-img.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form" method="post"
				action="Add_Employee">
				<p style="color: red;" align="center">
					<b> <%  
        	String conform=(String)session.getAttribute("conform");
        	if(null==conform)
        	{
        		out.println("<br>");
        	}else{
        	out.println(conform);
        	session.setAttribute("conform",null);
        	}
        %>
					</b>
				</p>
				<span class="login100-form-title p-b-37"> Add Employee </span>

				<div class="wrap-input100 validate-input m-b-20"
					data-validate="Enter name">
					<input class="input100" type="text" name="Name"
						placeholder="Employee Name"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Address">
					<input class="input100" type="text" name="Address"
						placeholder="Address"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Designation">
					<input class="input100" type="text" name="Designation"
						placeholder="Designation"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Faculty">
					<input class="input100" type="text" name="Faculty"
						placeholder="Faculty"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Department">
					<input class="input100" type="text" name="Department"
						placeholder="Department"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Qualifications">
					<input class="input100" type="text" name="Qualifications"
						placeholder="Qualifications"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter username">
					<input class="input100" type="text" name="Username"
						placeholder="Username"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter Password">
					<input class="input100" type="password" name="Password"
						placeholder="Password"> <span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<button class="login100-form-btn">Register</button>
				</div>
				

				<div class="container-login100-form-btn ">
					<button class="login100-form-btn" input type="reset" value="Reset">
						Reset</button>
				</div>
				

				<div class="text-center">
					<a href="List_Employees.jsp" class="txt2 hov1"> List All
						Employees </a>
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