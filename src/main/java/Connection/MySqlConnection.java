package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MySqlConnection {
	private Connection connect;
	private Statement statement;
	public Statement getConnection(){
		String sqlusername = "root";
		String sqlpassword = "2brdk0La";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false",sqlusername,sqlpassword);
			Statement statement = connect.createStatement();
			return statement;
		}catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + e1.getMessage());
		    System.out.println("SQLState: " + e1.getSQLState());
		    System.out.println("VendorError: " + e1.getErrorCode());
		}
		return null;
	}
}
