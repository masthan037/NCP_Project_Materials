package verbal.jdbc.connect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import verbal.jdbc.connect.verbal;

public class verbalDBUtil {
private DataSource dataSource;
	
	

	public verbalDBUtil(DataSource theDataSource) {
	dataSource = theDataSource;
	}
	
	public List<verbal> getmcqs() throws Exception {
		
		List<verbal> qs = new ArrayList<verbal>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from verbalmcq";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int mcqid = myRs.getInt("verbID");
				String mcqQ = myRs.getString("verbQuestion");
				String A = myRs.getString("A");
				String B = myRs.getString("B");
				String C = myRs.getString("C");
				String D = myRs.getString("D");
				String ans = myRs.getString("verbAns");
				
				
				// create new student object
				verbal tempmcq = new verbal(mcqid,mcqQ,A,B,C,D,ans);
				
				// add it to the list of students
				qs.add(tempmcq);				
			}
			
			return qs;		
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
