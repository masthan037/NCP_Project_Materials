package Login.account.jdbc.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection createConnection()
	 {
	     Connection con = null;
	     String url = "jdbc:mysql://localhost:3306/placement_prep_db?useSSL=false&amp;serverTimezone=UTC"; //MySQL URL and followed by the database name
	     String username = "root"; //MySQL username
	     String password = "Irfan@037"; //MySQL password   
	     try 
	     {
	         try 
	         {
	            Class.forName("com.mysql.jdbc.Driver"); //loading mysql driver 
	         } 
	         catch (ClassNotFoundException e)
	         {
	            e.printStackTrace();
	         } 
	         con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	         System.out.println("Printing connection object "+con);
	     } 
	     catch (Exception e) 
	     {
	        e.printStackTrace();
	     }
	     return con; 
	 }
	
	
}
