package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.MySqlConnection;

/**
 * Servlet implementation class editUserSevlet
 */
public class editUserSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUserSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getRequestURI().endsWith("/editUsers")) {
			String userid = request.getParameter("id");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String user_name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String birthdate = request.getParameter("birthdate");
			String query = "UPDATE shopping.users SET ID='"+userid+"',username='"+username+
					"',user_password='"+password+"',user_name='"+user_name+
					"',user_surname='"+surname+"',user_birthdate='"+birthdate+
					"' WHERE ID='"+ userid +"';";
			Statement statement = new MySqlConnection().getConnection();
	    	try {
				statement.executeUpdate(query);
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	request.getServletContext().getRequestDispatcher("/adminPanelUsers").forward(request,response);
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
