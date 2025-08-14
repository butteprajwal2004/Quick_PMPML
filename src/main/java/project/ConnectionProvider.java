package project;
import java.sql.*;

public class ConnectionProvider {
	public static Connection getCon()
	{
		try{
			Connection con;
	        Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pmpml_management", "root", "root");
	        return con;
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
}
}


