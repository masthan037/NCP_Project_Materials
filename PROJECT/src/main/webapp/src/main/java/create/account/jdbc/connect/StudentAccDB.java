package create.account.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentAccDB {
	private DataSource dataSource;
	
	public StudentAccDB(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	
	public boolean CheckUsernameExists(String username)
	{
	    boolean usernameExists = false;
	    Connection myConn = null;
 		Statement myStmt = null;
 		ResultSet myRs = null;
 		
 
         String userNameDB = "";
         try
         {
        	 myConn = dataSource.getConnection();//Fetch database connection object
        	 myStmt = myConn.createStatement(); //Statement is used to write queries. Read more about it.
        	 myRs = myStmt.executeQuery("select * from student"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
 
             while(myRs.next()) // Until next row is present otherwise it return false
             {
              userNameDB = myRs.getString("UserName"); //fetch the values present in database
               if(username.equals(userNameDB))
               {
            	   usernameExists = true;
            	   break;
            	 
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
	    
	    return usernameExists;
	}
	public List<StudentAcc> getStudents() throws Exception{
		
		List<StudentAcc> students = new ArrayList<StudentAcc>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		
		// First get connection
		
		// Second creeate SQL statements
		
		//execute query
		
		//Process results
		
		return students;
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

	public void addStudent(StudentAcc newStudent) throws Exception{
		// TODO Auto-generated method stub
		
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			//SQL for insert
			String sql = "insert into student "
						 +"(UserName, Firstname, Lastname, Email, DOB, Password) "
						 +"values (?,?,?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			//Set param values
			myStmt.setString(1, newStudent.getUserName());
			myStmt.setString(2, newStudent.getFirstname());
			myStmt.setString(3, newStudent.getLastname());
			myStmt.setString(4, newStudent.getEmail());
			myStmt.setString(5, newStudent.getDate());
			myStmt.setString(6, newStudent.getPassword());
			
			myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		}
	}
}
