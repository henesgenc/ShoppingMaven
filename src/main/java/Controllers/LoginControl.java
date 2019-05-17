package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.MySqlConnection;

/**
 * Servlet implementation class LoginControl
 */
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("user_password"); 
		Statement statement = new MySqlConnection().getConnection();
		boolean status=false;
			try {
				String query = "SELECT ID,username,user_password FROM shopping.users";
				ResultSet rs = statement.executeQuery(query);
				while(rs.next()) {
					String un = rs.getString("username");
					int id = rs.getInt("ID");
					if(username.equals(un)) {
						status=true;
						String pass = rs.getString("user_password");
						if(password.equals(pass)) {
							HttpSession session=request.getSession(); 
							session.setAttribute("user_id", id);
					        session.setAttribute("username",username); 
					        request.getServletContext().getRequestDispatcher("/products").
							forward(request, response);
						}
						else {
							request.setAttribute("passwordw", 1);
							 request.getServletContext().getRequestDispatcher("/login.jsp").
								forward(request, response);
						}
					}
				}
				if(!status) {
					request.setAttribute("passwordw", 2);
					 request.getRequestDispatcher("/login.jsp").
						forward(request, response);
				}
				statement.close();
			}catch(SQLException e) {
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
