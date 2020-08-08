package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.HttpSession;

/**
 * Servlet implementation class Delete_user
 */
@WebServlet("/Delete_user")
public class Delete_user extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		PreparedStatement ps;
		int i = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/OOP", "root", "");

			ps = conn.prepareStatement("DELETE FROM user WHERE id=?");
			ps.setString(1, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (i > 0) {
			String s = "Id '" + id + "' Sucessfully Deleted";
			session.setAttribute("conform", s);
			response.sendRedirect("List_Employees.jsp");
		}
	}

}
