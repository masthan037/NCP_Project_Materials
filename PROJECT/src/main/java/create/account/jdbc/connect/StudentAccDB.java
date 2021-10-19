package create.account.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentAccDB {
	private DataSource dataSource;
	
	public StudentAccDB(DataSource theDataSource) {
		dataSource = theDataSource;
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
