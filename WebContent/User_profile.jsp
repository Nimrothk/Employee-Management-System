<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User Profile</title>
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

	<%@include file="Header_user.jsp"%>
	</div>
	<div class="col-4">
		<a href="User_home.jsp">Home</a> <a class="active"
			href="User_profile.jsp">Profile</a> <a href="User_profile">Leave
			Details</a> <a href="Logout" class="btn btn-success">Sign Out</a>
	</div>
	</div>
	</div>

	<%
		Statement statement = con.createStatement();
		ResultSet resultset = statement.executeQuery("select * from user Where username='" + Username + "' ");

		if (resultset.next()) {
			String id = resultset.getString(1);
			String name = resultset.getString(2);
			String address = resultset.getString(3);
			String designation = resultset.getString(4);
			String faculty = resultset.getString(5);
			String department = resultset.getString(6);
			String qualification = resultset.getString(7);
			String username = resultset.getString(8);
	%>


	<div class="container-login100"
		style="background-image: url('images/bg-img.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form>
				<table style="cellpadding: 30px;" align="center">
					<tr>
						<td colspan="2" align="center"><h2>
								<b>Profile Details</b>
							</h2>
							<hr></td>
					</tr>

					<tr>
						<th>ID</th>
						<th><%=id%></th>
					</tr>
					<tr>
						<th>Name</th>
						<th><%=name%></th>
					</tr>
					<tr>
						<th>Address</th>
						<th><%=address%></th>
					</tr>
					<tr>
						<th>Designation</th>
						<th><%=designation%></th>
					</tr>
					<tr>
						<th>Faculty</th>
						<th><%=faculty%></th>
					</tr>

					<tr>
						<th>Department</th>
						<th><%=department%></th>
					</tr>

					<tr>
						<th>Qualification</th>
						<th><%=qualification%></th>
					</tr>

					<tr>
						<th>Username</th>
						<th><%=username%></th>
					</tr>

					<tr>
						<td colspan="2" align="center"><br /> <a
							href="User_pass.jsp" class="btn btn-success">Edit Password</a></td>
					</tr>

				</table>
			</form>


		</div>
	</div>


	<%
		}
	%>
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