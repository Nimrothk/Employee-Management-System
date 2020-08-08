<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<html lang="en">
<head>
<title>Admin List</title>
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

	<%@include file="Header_admin.jsp"%>
	
	
</div>
	<div class="col-9">
		<a href="Option.jsp">Home</a> <a href="Add_Employee.jsp">Add
			Employee</a> <a href="List_Employees.jsp">View Employee</a> <a
			href="Add_Admin.jsp">Add Admin</a> <a class="active"
			href="List_Admin.jsp">View Admin</a> <a href="News.jsp">Post News</a>
		<a href="List_News.jsp">List News</a> <a href="Logout"
			class="btn btn-success">Sign Out</a>
	</div>
</div>
</div>

	<%
		Statement statement = con.createStatement();
		ResultSet resultset = null;
		if (request.getParameter("search") == null) {
			resultset = statement.executeQuery("select * from admin ");
		} else {
			String s = request.getParameter("search");

			resultset = statement.executeQuery("select * from admin WHERE name LIKE '%" + s
					+ "%' or username LIKE '%" + s + "%' or id LIKE '%" + s + "%'");
		}
	%>






	<div class="table-responsive container">
		<table class="table">
			<br />
			<form action="" method="post">
				<input type="text" name="search"
					placeholder="Search...    Id / First Name / Position">
			</form>
			<thead>
				<p style="color: red;" align="center">
					<b> <%
 	String conform = (String) session.getAttribute("conform");
 	if (null == conform) {
 		out.println("<br>");
 	} else {
 		out.println(conform);
 		session.setAttribute("conform", null);
 	}
 %>
					</b>
				</p>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Address</th>
					<th scope="col">Designation</th>
					<th scope="col">position</th>
					<th scope="col">Username</th>
					<th scope="col">Delete</th>
					<th scope="col">View</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (resultset.next()) {
						String id = resultset.getString(1);
						String name = resultset.getString(2);
						String address = resultset.getString(3);
						String designation = resultset.getString(4);
						String position = resultset.getString(5);
						String username = resultset.getString(6);
				%>
				<tr>
					<td>
						<%
							out.print(id);
						%>
					</td>
					<td>
						<%
							out.print(name);
						%>
					</td>
					<td>
						<%
							out.print(address);
						%>
					</td>
					<td>
						<%
							out.print(designation);
						%>
					</td>
					<td>
						<%
							out.print(position);
						%>
					</td>

					<td>
						<%
							out.print(username);
						%>
					</td>

					<td><a href="Delete_admin?id=<%out.print(id);%>">
							<button class="btn btn-primary btn-sm">Delete</button>
					</a></td>

					<td><a href="DeleteUser?id=<%out.print(id);%>">
							<button class="btn btn-primary btn-sm">View</button>
					</a></td>

				</tr>

				<%
					}
				%>

			</tbody>
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

	<style>
input[type=text] {
	width: 130px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image: url('searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
	width: 100%;
}

form {
	float: left;
	width: 100%;
	border: 0;
}
</style>

</body>
</html>