package Login.account.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import Login.account.jdbc.connect.*;


public class LoginDB {
	
	private DataSource dataSource;
	
	 public LoginDB(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public String authenticateUser(LoginAcc Loginacc)
     {
         String userName = Loginacc.getUserName(); //Assign user entered values to temporary variables.
         String password = Loginacc.getPassword();
         
         Connection myConn = null;
 		Statement myStmt = null;
 		ResultSet myRs = null;
 		
 
         String userNameDB = "";
         String passwordDB = "";
         
         try
         {
        	 myConn = dataSource.getConnection();//Fetch database connection object
        	 myStmt = myConn.createStatement(); //Statement is used to write queries. Read more about it.
        	 myRs = myStmt.executeQuery("select userName,password from student"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
 
             while(myRs.next()) // Until next row is present otherwise it return false
             {
              userNameDB = myRs.getString("userName"); //fetch the values present in database
              passwordDB = myRs.getString("password");
 
               if(userName.equals(userNameDB) && password.equals(passwordDB))
               {
                  return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Invalid user credentials";
         
         

 		
 		
 		// Return appropriate message in case of failure
 		}   
     
 		
}
