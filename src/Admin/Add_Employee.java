package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Add_Employee
 */
@WebServlet("/Add_Employee")
public class Add_Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add_Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/jsp;charset=UTF-8");

		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();

		String name = request.getParameter("Name");
		String address = request.getParameter("Address");
		String designation = request.getParameter("Designation");
		String faculty = request.getParameter("Faculty");
		String department = request.getParameter("Department");
		String qualification = request.getParameter("Qualifications");
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/OOP", "root", "");

			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery("select username from user");
			if (rs.next()) {
				String remail = rs.getString(1);

				if (remail.equals(username)) {
					String s = "This Employee Is Already Registered";
					session.setAttribute("conform", s);
					response.sendRedirect("Add_Employee.jsp");
				} else {

					PreparedStatement ps = con.prepareStatement(
							"insert into user(name,address,designation,faculty,department,qualification,username,password) values(?,?,?,?,?,?,?,?)");

					ps.setString(1, name);
					ps.setString(2, address);
					ps.setString(3, designation);
					ps.setString(4, faculty);
					ps.setString(5, department);
					ps.setString(6, qualification);
					ps.setString(7, username);
					ps.setString(8, password);

					int i = ps.executeUpdate();

					if (i > 0) {

						String s = "New Employee Added";
						session.setAttribute("conform", s);
						response.sendRedirect("Add_Employee.jsp");
					}
				}
			}

		} catch (Exception se) {
			out.print(se);
			/*
			 * String s="Invalid Details Try Again";
			 * session.setAttribute("conform", s);
			 * response.sendRedirect("Add_Employee.jsp");
			 */
		}

	}
}
