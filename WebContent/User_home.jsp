<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<html lang="en">
<head>
<title>User Home</title>
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
<link rel="stylesheet" type="text/css" href="bootstrap.css">

</head>
<body>

	<%@include file="Header_user.jsp"%>
	</div>
	<div class="col-4">
		<a class="active" href="User_home.jsp">Home</a> <a
			href="User_profile.jsp">Profile</a> <a href="User_profile">Leave
			Details</a> <a href="Logout" class="btn btn-success">Sign Out</a>
	</div>
	</div>
	</div>

	<%
		Statement statement = con.createStatement();
		ResultSet resultset = null;
		if (request.getParameter("search") == null) {
			resultset = statement.executeQuery("select * from message ");
		} else {
			String s = request.getParameter("search");

			resultset = statement.executeQuery("select * from message WHERE name LIKE '%" + s
					+ "%' or title LIKE '%" + s + "%' or subtitle LIKE '%" + s + "%'");
		}
	%>


	<div class="table-responsive container">

		<table class="table">

			<%
				while (resultset.next()) {

					String title = resultset.getString(2);
					String subtitle = resultset.getString(3);
					String message = resultset.getString(4);
					String date = resultset.getString(5);
			%>
			<br />
			<div class="card">
				<div class="card-header">
					<h5>
						<%
							out.print(title);
						%>
					</h5>
				</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<h6>
							<%
								out.print(subtitle);
							%>
						</h6>
						<p>
							<%
								out.print(message);
							%>
						</p>
						<footer class="blockquote-footer">
							Thank You <cite title="Source Title"> <br /> <%
 	out.print(date);
 %></cite>
						</footer>
					</blockquote>
				</div>
			</div>


			<%
				}
			%>

		</table>

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


</style>
</html>