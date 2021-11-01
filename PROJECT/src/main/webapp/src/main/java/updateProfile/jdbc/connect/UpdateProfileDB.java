package updateProfile.jdbc.connect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class UpdateProfileDB {

	private DataSource dataSource;
	public UpdateProfileDB(DataSource dataSource) {
		// TODO Auto-generated constructor stub
		this.dataSource = dataSource;
	}
	public void UpdateDetails(UpdateProfile updateProfile, String CurrentUserName,
			String Firstname,String Lastname,String Email,String Date) {
		// TODO Auto-generated method stub
		
		 Connection myConn = null;
	 		Statement myStmt = null;
	 		ResultSet myRs = null;
	 		
	 		 try
	         {
	        	 myConn = dataSource.getConnection();//Fetch database connection object
	        	 myStmt = myConn.createStatement(); //Statement is used to write queries. Read more about it.
	        	  myStmt.executeUpdate("Update student set Firstname='"+Firstname+"',Lastname='"+Lastname+"',Email='"+Email+"',DOB='"+Date+"' where UserName='"+CurrentUserName+";'");
	        	
	             
	         }
	             catch(SQLException e)
	             {
	                e.printStackTrace();
	             }
	         finally {
	 			// close JDBC objects
	 			close(myConn, myStmt, myRs);
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
