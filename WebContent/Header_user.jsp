<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<body>

	<div id="navbar">
		<div class="row">

			<div class="col-8">
				<div style="font-size: 17px;">
					<b>Sliit Employee Management System</b>
				</div>

				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/OOP", "root", "");
					String Username = (String) session.getAttribute("username");
					String uname;
					PreparedStatement ps = con.prepareStatement("select * from user where username=?");

					ps.setString(1, Username);
					ResultSet rs = ps.executeQuery();

					if (null == Username) {
						response.sendRedirect("Login_Option.jsp");
					}

					if (rs.next()) {
						uname = rs.getString("name");
						out.print("<b><span style='color:white;'>&nbsp;&nbsp;Hi&nbsp;  " + uname + "</span></b>");
					} else {
						uname = "";

						out.print("<b><span style='color:white;'>&nbsp;&nbsp;" + uname + "</span></b>");
					}
				%>
			
</body>
<style>
#navbar {
	overflow: hidden;
	background-color: #bd59d4;
}

#navbar a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

#navbar a:hover {
	background-color: #ddd;
	color: black;
}

#navbar a.active {
	background-color: #4CAF50;
	color: white;
	.
	content
	{
	padding
	:
	16px;
}
}
</style>
</html>
