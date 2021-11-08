package Login.account.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Login.account.jdbc.connect.*;
import create.account.jdbc.connect.StudentAcc;


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
        	 myRs = myStmt.executeQuery("select * from student"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
 
             while(myRs.next()) // Until next row is present otherwise it return false
             {
              userNameDB = myRs.getString("UserName"); //fetch the values present in database
              passwordDB = myRs.getString("Password");
 
               if(userName.equals(userNameDB) && password.equals(passwordDB))
               {
            	  
            	  String userinfo = "SUCCESS"+"+"+myRs.getString("UserName")+"+"+myRs.getString("Firstname")+"+"+myRs.getString("Lastname")+"+"+myRs.getString("Email")+"+"+myRs.getString("DOB")+"+"+myRs.getString("Password")+"+"+myRs.getString("gender");          			 
                  return userinfo; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
         finally {
 			// close JDBC objects
 			close(myConn, myStmt, myRs);
 		}
         
             return "Invalid user credentials+";
         
         

 		
 		
 		// Return appropriate message in case of failure
 		}   
	
	public String CountUser() throws SQLException
    {	
		
		String countUser="";
		int temp=0;
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select count(*) as usercount from student";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				countUser = String.valueOf(myRs.getInt("usercount"));
				
			}
			System.out.println(countUser);
			return countUser;		
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
    }
	
	public String CountReplies(String user) throws Exception {
		
		String count1="",count2="5";
		int temp=0;
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select count(*) as userreply,username  from questionreplies group by username";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				temp=temp+myRs.getInt("userreply");
				// retrieve data from result set row
				if(user.equals(myRs.getString("username"))) {
				count1 = String.valueOf(myRs.getInt("userreply"));
				}
				
			}
			count2=String.valueOf(temp);
			count1="+"+count1+"+"+count2;
			//System.out.println(count1);
			return count1;		
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	public String CountQ(String user) throws Exception {
		
		String count1="",count2="";
		int temp=0;
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select count(*) as userq,username  from question group by username";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				temp=temp+myRs.getInt("userq");
				// retrieve data from result set row
				if(user.equals(myRs.getString("username"))) {
				count1 = String.valueOf(myRs.getInt("userq"));
				}
				
			}
			count2=String.valueOf(temp);
			count1="+"+count1+"+"+count2;
			//System.out.println(count1);
			return count1;		
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close();   // doesn't really close it ... just puts back in connection pool
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}
 		
}
