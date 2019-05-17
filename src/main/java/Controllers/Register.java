package Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.MySqlConnection;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Statement statement = new MySqlConnection().getConnection();
		boolean htn = false;
		String username = request.getParameter("username");
		String user_password = request.getParameter("user_password");
		String user_name = request.getParameter("user_name");
		String user_surname = request.getParameter("user_surname");
		String user_birthdate = request.getParameter("user_birthdate");
		String controlquery = "SELECT username FROM shopping.users";
		ResultSet rs;
		try {
			rs = statement.executeQuery(controlquery);
			while(rs.next()) {
				String un = rs.getString("username");
				if(un.equals(username)) {
					htn = true;
				}
			}
			if(htn) {
				request.getServletContext().getRequestDispatcher("/register.jsp").
				forward(request, response);
			}else {
				String query = "INSERT INTO `shopping`.`users` (`username`, `user_password`, `user_name`, `user_surname`, `user_birthdate`) VALUES "
						+ "('"+ username +"', '"+ user_password +"', '"+ user_name +"', '"+ user_surname +"', '"+ user_birthdate +"');";
				statement.executeUpdate(query);
				response.sendRedirect("./login");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
