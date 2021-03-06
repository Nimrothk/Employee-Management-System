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
 * Servlet implementation class Add_admin
 */
@WebServlet("/Add_admin")
public class Add_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add_admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
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
		String position = request.getParameter("Position");
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/OOP", "root", "");

			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery("select username from admin");
			if (rs.next()) {
				String remail = rs.getString(1);

				if (remail.equals(username)) {
					String s = "This Admin Is Already Registered";
					session.setAttribute("conform", s);
					response.sendRedirect("Add_Admin.jsp");
				} else {
					PreparedStatement ps = con.prepareStatement(
							"insert into admin(name,address,designation,position,username,password) values(?,?,?,?,?,?)");

					ps.setString(1, name);
					ps.setString(2, address);
					ps.setString(3, designation);
					ps.setString(4, position);
					ps.setString(5, username);
					ps.setString(6, password);

					int i = ps.executeUpdate();

					if (i > 0) {

						String s = "New Admin Added";
						session.setAttribute("conform", s);
						response.sendRedirect("Add_Admin.jsp");
					}

				}

			}
		} catch (Exception se) {
			/*
			 * String s="Invalid Details Try Again";
			 * session.setAttribute("conform", s);
			 * response.sendRedirect("Add_Admin.jsp");
			 */
		}

	}
}