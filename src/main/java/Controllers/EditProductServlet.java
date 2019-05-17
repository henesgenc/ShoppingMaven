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
 * Servlet implementation class EditProductServlet
 */
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String id = request.getParameter("id");
			String image = request.getParameter("image");
			if(!request.getParameter("changeimage").equals("")) {
				image = request.getParameter("changeimage");
			}
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String price = request.getParameter("price");
			String details = request.getParameter("details");
			String query = "UPDATE shopping.product SET P_ID='"+id+"',P_Image='"+image+
					"',Product_Name='"+name+"',Product_Type='"+type+
					"',Price='"+price+"',Detail='"+details+
					"' WHERE P_ID='"+ id +"';";
			Statement statement = new MySqlConnection().getConnection();
	    	try {
				statement.executeUpdate(query);
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	request.getServletContext().getRequestDispatcher("/adminPanelProducts").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
