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
 * Servlet implementation class News
 */
@WebServlet("/News")
public class News extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public News() {
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

		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		String message = request.getParameter("message");

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/OOP", "root", "");

			PreparedStatement ps = con.prepareStatement("insert into message(title,subtitle,message) values(?,?,?)");

			ps.setString(1, title);
			ps.setString(2, subtitle);
			ps.setString(3, message);

			int i = ps.executeUpdate();

			if (i > 0) {

				String s = "New Message Sucessfully Added";
				session.setAttribute("conform", s);
				response.sendRedirect("News.jsp");
			}

		} catch (Exception se) {
			out.print(se);
			/*
			 * String s="Invalid Details Try Again";
			 * session.setAttribute("conform", s);
			 * response.sendRedirect("Add_Admin.jsp");
			 */
		}

	}
}
