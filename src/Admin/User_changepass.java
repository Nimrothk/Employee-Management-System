package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class User_changepass
 */
@WebServlet("/User_changepass")
public class User_changepass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_changepass() {
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
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();

		String email = (String) session.getAttribute("username");
		String oldPass = request.getParameter("currentpass");
		String pass = request.getParameter("confirmpass");

		if (oldPass == null || pass == null) {
			response.sendRedirect("User_pass.jsp");
		}

		else {
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/OOP", "root", "");
				PreparedStatement ps = con.prepareStatement(
						"update user set  password =? where password='" + oldPass + "' and username='" + email + "' ");
				ps.setString(1, pass);
				int i = ps.executeUpdate();

				if (i > 0) {
					String s = "Password Changed";
					session.setAttribute("conform", s);
					response.sendRedirect("User_pass.jsp");
				} else {
					String s = "Invalid Old Password";
					session.setAttribute("conform", s);
					response.sendRedirect("User_pass.jsp");
				}
			} catch (Exception se) {
				String s = "Invalid Old Password";
				session.setAttribute("conform", s);
				response.sendRedirect("User_pass.jsp");

			}

		}
	}
}
