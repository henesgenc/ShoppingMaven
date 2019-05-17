package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

import Data.Product;
import Connection.MySqlConnection;

/**
 * Servlet implementation class MainServlet
 */
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * Default constructor. 
     */
	private List<Product> cart = new ArrayList<Product>();
	private List<Product> products = new ArrayList<Product>(); 
	private String type = null;
    public MainServlet() {
        // TODO Auto-generated constructor stub
    	super();
    }
    public void init(ServletConfig config) throws ServletException {
		
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if(uri.endsWith("/login")) {
			request.setAttribute("passwordw", 0);
			request.getServletContext().getRequestDispatcher("/login.jsp").
			forward(request, response);
		}
		else if(uri.endsWith("/products")) {
			sendProductList(request, response);
		}
		else if(uri.endsWith("/register")) {
			request.getServletContext().getRequestDispatcher("/register.jsp").
			forward(request, response);
		}
		else if(uri.endsWith("/viewProductDetails")) {
			sendProductDetail(request, response);
		}
		else if(uri.endsWith("/addCart")) {
			if(request.getSession().getAttribute("username") != null) {
				String pIdStr = request.getParameter("id");
				int pIdInt = Integer.parseInt(pIdStr);
				Product product = getProduct(pIdInt);
				cart.add(product);
				request.setAttribute("products", products);
				request.getSession().setAttribute("cart",cart);
				request.getServletContext().getRequestDispatcher("/products.jsp").forward(request,response);
			}
			else {
				request.setAttribute("passwordw", 3);
				request.getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
			}
		}
		else if(uri.endsWith("/viewCart")) {
			request.getServletContext().getRequestDispatcher("/viewCart.jsp").forward(request,response);
		}
		else if(uri.endsWith("/logout")) {
			Statement statement = new MySqlConnection().getConnection();
			for(Product p: cart) {
				String query = "INSERT INTO shopping.carts (user_id,product_id)"
						+ " VALUES("+request.getSession().getAttribute("user_id")+","+p.getId()+")";
				try {
					statement.executeUpdate(query);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			request.getSession().invalidate();
			request.getRequestDispatcher("index.jsp").forward(request,response);
			cart.clear();
		}
		else if(uri.endsWith("/filter")) {
			getProducts();
			String type = request.getParameter("type");
			request.setAttribute("type", type);
			sendProductList(request, response);
		}
		else if(uri.endsWith("/deleteProductList")) {
            int productid = Integer.parseInt(request.getParameter("id"));
            for(Product c : cart) {
                if(c.getId()==productid) {
                	if(cart.size()==1) {
                		cart.remove(c);
                		request.getSession().setAttribute("cart", null);
                		request.getServletContext().getRequestDispatcher("/viewCart").forward(request,response);
                		break;
                	}
                	else {
                		cart.remove(c);
                		request.getServletContext().getRequestDispatcher("/viewCart").forward(request,response);
                		break;
                	}
                }
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
	private Product getProduct(int productId) {
		for(Product product : products) {
			if(product.getId() == productId) {
				return product;}
		}
		return null;
	}
	public void getProducts() {
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
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void sendProductList(HttpServletRequest request,
			HttpServletResponse response) 
	throws IOException, ServletException
	{
		getProducts();
		request.setAttribute("products", products);
		request.getServletContext().getRequestDispatcher("/products.jsp").
			forward(request, response);
	}
	private void sendProductDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String pIdStr = request.getParameter("id");
		int pIdInt = Integer.parseInt(pIdStr);
		Product product = getProduct(pIdInt);
		request.setAttribute("product", product);
		request.getServletContext().getRequestDispatcher("/detail.jsp").forward(request,response);
	}
}
