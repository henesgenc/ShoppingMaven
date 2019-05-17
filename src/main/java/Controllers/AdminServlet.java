package Controllers;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.MySqlConnection;
import Data.Product;
import Data.Users;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Users> users = new ArrayList<Users>();
	private List<Product> products = new ArrayList<Product>(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		getUsers();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if(uri.endsWith("/adminPanelUsers")) {
			getUsers();
			request.setAttribute("users", users);
			request.getServletContext().getRequestDispatcher("/adminPanelUsers.jsp").forward(request,response);
		}
		else if(uri.endsWith("/deleteUser")) {
			String userid = request.getParameter("id");
			Statement statement = new MySqlConnection().getConnection();
	    	String query = "DELETE FROM shopping.users WHERE ID="+ userid +";";
	    	try {
				statement.executeUpdate(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	getUsers();
	    	response.sendRedirect("./adminPanelUsers");
		}
		else if(uri.endsWith("/editUser")) {
			String userid = request.getParameter("id");
			Statement statement = new MySqlConnection().getConnection();
			String query = "SELECT * FROM shopping.users WHERE ID="+userid+";";
			ResultSet rs = null;
			try {
				rs = statement.executeQuery(query);
				while(rs.next()) {
					request.setAttribute("id", rs.getInt("ID"));
					request.setAttribute("username", rs.getString("username"));
					request.setAttribute("password", rs.getString("user_password"));
					request.setAttribute("name",rs.getString("user_name"));
					request.setAttribute("surname", rs.getString("user_surname"));
					request.setAttribute("birthdate", rs.getDate("user_birthdate"));
				}
				statement.close();
				request.getServletContext().getRequestDispatcher("/editUser.jsp").forward(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(uri.endsWith("/adminPanelProducts")) {
			Statement statement = new MySqlConnection().getConnection();
	    	String query = "SELECT * FROM shopping.product;";
	    	ResultSet rs = null;
	    	products.clear();
			try {
				rs = statement.executeQuery(query);
				while(rs.next()) {
					int P_ID = rs.getInt("P_ID");
					String P_img = rs.getString("P_Image");
					String P_Name = rs.getString("Product_Name");
					String P_Type = rs.getString("Product_Type");
					float Price = rs.getFloat("Price");
					String P_Detail = rs.getString("Detail");
					products.add(new Product(P_ID,P_img,P_Name,P_Type,Price,P_Detail));
				}
				request.setAttribute("products", products);
				request.getServletContext().getRequestDispatcher("/adminPanelProducts.jsp").forward(request,response);
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(uri.endsWith("/deleteProduct")) {
			String pid = request.getParameter("id");
			int ppid = Integer.parseInt(pid);
			Statement statement = new MySqlConnection().getConnection();
	    	String query = "DELETE FROM shopping.product WHERE P_ID="+ pid +";";
	    	try {
				statement.executeUpdate(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	for(Product p: products) {
	    		if(p.getId()==ppid) {
	    			products.remove(p);
	    			break;
	    		}
	    	}
	    	response.sendRedirect("./adminPanelProducts");
		}
		else if(uri.endsWith("/editProduct")) {
			String pid = request.getParameter("id");
			Statement statement = new MySqlConnection().getConnection();
			String query = "SELECT * FROM shopping.product WHERE P_ID="+pid+";";
			ResultSet rs = null;
			try {
				rs = statement.executeQuery(query);
				while(rs.next()) {
					request.setAttribute("id", rs.getInt("P_ID"));
					request.setAttribute("image", rs.getString("P_Image"));
					request.setAttribute("name", rs.getString("Product_Name"));
					request.setAttribute("type",rs.getString("Product_Type"));
					request.setAttribute("price", rs.getFloat("Price"));
					request.setAttribute("detail", rs.getString("Detail"));
				}
				statement.close();
				request.getServletContext().getRequestDispatcher("/adminPanelEditProduct.jsp").forward(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void getUsers() {
		Statement statement = new MySqlConnection().getConnection();
    	String query = "SELECT * FROM shopping.users;";
    	users.clear();
    	ResultSet rs = null;
			try {
				rs = statement.executeQuery(query);
				while(rs.next()) {
					int ID = rs.getInt("ID");
					String username = rs.getString("username");
					String user_password = rs.getString("user_password");
					String user_name = rs.getString("user_name");
					String user_surname = rs.getString("user_surname");
					Date user_birthdate = rs.getDate("user_birthdate");
					users.add(new Users(ID,username,user_password,user_name,user_surname,user_birthdate));
				}
				statement.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
	}
	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
