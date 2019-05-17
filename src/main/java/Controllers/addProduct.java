package Controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.MySqlConnection;
import Data.Product;

/**
 * Servlet implementation class addProduct
 */
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statement statement;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
    	 	
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		statement = new MySqlConnection().getConnection();
		String query = "INSERT INTO shopping.product (P_Image,Product_Name,Product_Type,Price,Detail)"
				+ " VALUES('"+request.getParameter("image")+"','"+request.getParameter("name")+"','"+request.getParameter("type").toString()+"',"
				+ request.getParameter("price")+",'"+request.getParameter("details")+"')";
		request.getServletContext().getRequestDispatcher("/adminPanelProducts").forward(request,response);
		try {
			statement.executeUpdate(query);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
