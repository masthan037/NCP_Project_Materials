package resetPassword.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class ResetPasswordDB {

	private DataSource dataSource;
	
	public ResetPasswordDB(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void ResetPassword(ResetPassword resetPassword, String newPassword, String CurrentUserName) throws SQLException{
		// TODO Auto-generated method stub
		
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update student "
						+ "set Password=? "
						+ "where UserName="+"'"+CurrentUserName+"'";
			
			
			myStmt = myConn.prepareStatement(sql);
			// set params
			myStmt.setString(1, newPassword);
			myStmt.execute();
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
